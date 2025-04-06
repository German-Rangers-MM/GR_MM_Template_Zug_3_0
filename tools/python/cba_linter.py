import argparse
import json
import os
import re
import sys
from pathlib import Path
from enum import Enum

class IssueLevel(Enum):
    ERROR = "error"
    WARNING = "warning"
    NOTE = "notice"

def parse_line(line):
    issues = []
    clean_line = line.split('//')[0].strip()
    
    if not clean_line:
        return issues

    # Check semicolon
    if not line.strip().endswith(';'):
        issues.append(("Missing semicolon", IssueLevel.ERROR))
    
    # Split assignment
    if '=' not in clean_line:
        issues.append(("Missing assignment operator (=)", IssueLevel.ERROR))
        return issues
    
    left, value = clean_line.split('=', 1)
    left = left.strip()
    value = value.strip().rstrip(';')
    
    # Validate force keywords
    force_count = 0
    parts = left.split()
    var_name = None
    
    for part in parts:
        if part == 'force':
            if var_name is None:
                force_count += 1
            else:
                issues.append(("'force' keyword after variable name", IssueLevel.ERROR))
        else:
            if var_name is None:
                var_name = part
                if not re.match(r'^[a-zA-Z0-9_]+$', var_name):
                    issues.append((f"Invalid variable name: {var_name}", IssueLevel.ERROR))
            else:
                issues.append((f"Unexpected token: {part}", IssueLevel.ERROR))
    
    # Validate force count
    if force_count > 2:
        issues.append(("Maximum 2 'force' keywords allowed", IssueLevel.ERROR))
    
    # Validate value format
    if value:
        if value.lower() in ['true', 'false'] and value != value.lower():
            issues.append((f"Boolean value should be lowercase: {value}", IssueLevel.WARNING))
        elif not re.match(r'^(\[.*\]|".*"|-?\d+\.?\d*|true|false)$', value):
            issues.append((f"Invalid value format: {value}", IssueLevel.ERROR))
    
    return issues

def lint_file(file_path, repo_root):
    issues = []
    try:
        with open(file_path, 'r') as f:
            for line_num, line in enumerate(f, 1):
                line_issues = parse_line(line.strip())
                for msg, level in line_issues:
                    issues.append({
                        "file": str(Path(file_path).relative_to(repo_root)),
                        "line": line_num,
                        "message": msg,
                        "level": level.value
                    })
    except Exception as e:
        issues.append({
            "file": str(Path(file_path).relative_to(repo_root)),
            "line": 0,
            "message": f"File read error: {str(e)}",
            "level": IssueLevel.ERROR.value
        })
    return issues

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('config_dir', help='Config directory to lint')
    args = parser.parse_args()
    
    repo_root = Path(os.getenv('GITHUB_WORKSPACE', os.getcwd()))
    config_dir = repo_root / args.config_dir
    
    all_issues = []
    for cfg_file in config_dir.rglob('*.cfg'):
        all_issues.extend(lint_file(cfg_file, repo_root))
    
    # Output results
    print(json.dumps(all_issues))
    
    # Set exit code
    if any(issue['level'] == 'error' for issue in all_issues):
        sys.exit(1)
    sys.exit(0)

if __name__ == '__main__':
    main()

import argparse
import json
import os
import re
from pathlib import Path
from enum import Enum

class IssueLevel(Enum):
    ERROR = "error"
    WARNING = "warning"

ISSUE_CODES = {
    "semicolon": "CBA101",
    "assignment": "CBA102",
    "force_placement": "CBA103",
    "extra_token": "CBA104",
    "missing_var": "CBA105",
    "invalid_var": "CBA106",
    "force_count": "CBA107",
    "boolean_case": "CBA201",
    "value_format": "CBA108",
}

def parse_line(raw_line):
    line = raw_line.split('//')[0].strip()
    issues = []
    
    if not line:
        return issues

    # Check for missing semicolon
    if line and not line.endswith(';'):
        issues.append({
            "code": ISSUE_CODES["semicolon"],
            "message": "Missing semicolon at end of line",
            "suggestion": f"{raw_line.rstrip()};"
        })
        return issues  # Critical error, return early

    line = line[:-1].strip()  # Remove semicolon for further processing

    # Validate assignment syntax
    if '=' not in line:
        issues.append({
            "code": ISSUE_CODES["assignment"],
            "message": "Invalid assignment syntax (missing =)"
        })
        return issues  # Critical error, return early

    left, value = [part.strip() for part in line.split('=', 1)]
    tokens = left.split()
    
    # Parse force keywords and variable name
    force_count = 0
    var_name = None
    for token in tokens:
        if token == 'force':
            if var_name is None:
                force_count += 1
            else:
                issues.append({
                    "code": ISSUE_CODES["force_placement"],
                    "message": "Unexpected 'force' after variable name"
                })
        else:
            if var_name is None:
                var_name = token
            else:
                issues.append({
                    "code": ISSUE_CODES["extra_token"],
                    "message": f"Extra token '{token}' after variable name"
                })

    # Validate variable name
    if not var_name:
        issues.append({
            "code": ISSUE_CODES["missing_var"],
            "message": "Missing variable name"
        })
    elif not re.match(r'^[a-zA-Z0-9_]+$', var_name):
        issues.append({
            "code": ISSUE_CODES["invalid_var"],
            "message": f"Invalid variable name: {var_name}"
        })

    # Validate force count
    if force_count > 2:
        issues.append({
            "code": ISSUE_CODES["force_count"],
            "message": f"Too many force keywords: {force_count}"
        })

    # Validate value format
    value_issues = []
    if value.lower() in ['true', 'false']:
        if value != value.lower():
            issues.append({
                "code": ISSUE_CODES["boolean_case"],
                "level": IssueLevel.WARNING,
                "message": f"Boolean value should be lowercase",
                "suggestion": value.lower()
            })
    elif not (re.match(r'^-?\d+\.?\d*$', value) or 
             re.match(r'^\[.*\]$', value) or 
             re.match(r'^".*"$', value)):
        issues.append({
            "code": ISSUE_CODES["value_format"],
            "message": f"Invalid value format: {value}"
        })

    return issues

def lint_file(file_path, repo_root):
    issues = []
    rel_path = str(file_path.relative_to(repo_root))
    
    with open(file_path, 'r') as f:
        for line_num, line in enumerate(f, 1):
            for issue in parse_line(line.strip()):
                entry = {
                    "code": issue.get("code", ""),
                    "message": issue["message"],
                    "level": issue.get("level", IssueLevel.ERROR).value,
                    "location": {
                        "path": rel_path,
                        "range": {
                            "start": {"line": line_num}
                        }
                    }
                }
                if "suggestion" in issue:
                    entry["suggestions"] = [{
                        "text": issue["suggestion"]
                    }]
                issues.append(entry)
    return issues

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('config_dir', help='Config directory to lint')
    args = parser.parse_args()
    
    repo_root = Path(os.getcwd())
    config_dir = repo_root / args.config_dir
    
    all_issues = []
    for cfg_file in config_dir.rglob('*.cfg'):
        all_issues.extend(lint_file(cfg_file, repo_root))
    
    for issue in all_issues:
        print(json.dumps(issue))

if __name__ == '__main__':
    main()

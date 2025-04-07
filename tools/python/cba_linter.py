import argparse
import json
import os
import re
import sys
from pathlib import Path
from enum import Enum

class Severity(Enum):
    ERROR = "ERROR"
    WARNING = "WARNING"

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
    "string_quote": "CBA109",
}

def parse_line(raw_line: str) -> list:
    original_line = raw_line.rstrip('\n')
    line = original_line.split('//')[0].strip()
    issues = []
    
    if not line:
        return issues

    # Check for semicolon
    if not line.endswith(';'):
        issues.append({
            "code": ISSUE_CODES["semicolon"],
            "message": "Missing semicolon at end of line",
            "severity": Severity.ERROR.value,
            "suggestion": f"{original_line.rstrip(';').strip()};"
        })

    # Process force keywords
    force_count = len(re.findall(r'\bforce\b', line))
    if force_count > 2:
        issues.append({
            "code": ISSUE_CODES["force_count"],
            "message": f"Too many force keywords ({force_count})",
            "severity": Severity.ERROR.value
        })

    # Validate assignment format
    if '=' not in line:
        issues.append({
            "code": ISSUE_CODES["assignment"],
            "message": "Missing assignment operator (=)",
            "severity": Severity.ERROR.value
        })
    else:
        left, value = [part.strip() for part in line.split('=', 1)]
        
        # Validate variable name
        var_name = left.split()[-1] if left.split() else None
        if not var_name or not re.match(r'^[a-zA-Z0-9_]+$', var_name):
            issues.append({
                "code": ISSUE_CODES["invalid_var"],
                "message": f"Invalid variable name: {var_name}",
                "severity": Severity.ERROR.value
            })

        # Validate value format
        if value and not re.match(r'^(true|false|\d+\.?\d*|\[.*\]|".*")$', value):
            issues.append({
                "code": ISSUE_CODES["value_format"],
                "message": f"Invalid value format: {value}",
                "severity": Severity.ERROR.value
            })

    return issues

def lint_file(file_path: Path, repo_root: Path) -> list:
    issues = []
    rel_path = str(file_path.relative_to(repo_root))
    
    with open(file_path, 'r', encoding='utf-8') as f:
        for line_num, raw_line in enumerate(f, 1):
            for issue in parse_line(raw_line.strip()):
                entry = {
                    "message": issue["message"],
                    "code": issue["code"],
                    "severity": issue["severity"],
                    "location": {
                        "path": rel_path,
                        "range": {
                            "start": {"line": line_num, "column": 1},
                            "end": {"line": line_num, "column": len(raw_line)}
                        }
                    }
                }
                if "suggestion" in issue:
                    entry["suggestions"] = [{
                        "text": issue["suggestion"],
                        "range": {
                            "start": {"line": line_num, "column": 1},
                            "end": {"line": line_num, "column": len(raw_line)}
                        }
                    }]
                issues.append(entry)
    return issues

def main():
    parser = argparse.ArgumentParser(description='CBA Config Linter')
    parser.add_argument('config_dir', help='Directory containing .cfg files')
    args = parser.parse_args()

    repo_root = Path(os.environ.get('GITHUB_WORKSPACE', Path.cwd()))
    config_dir = repo_root / args.config_dir

    if not config_dir.exists():
        print(f"::error::Config directory not found: {config_dir}", file=sys.stderr)
        sys.exit(1)

    all_issues = []
    for cfg_file in config_dir.rglob('*.cfg'):
        if cfg_file.is_file():
            all_issues.extend(lint_file(cfg_file, repo_root))

    for issue in all_issues:
        print(json.dumps(issue))

if __name__ == '__main__':
    main()

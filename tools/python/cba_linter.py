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

    # Check for semicolon first
    if not line.endswith(';'):
        suggestion = f"{original_line.rstrip(';').strip()};" if ';' not in original_line else original_line
        issues.append({
            "code": ISSUE_CODES["semicolon"],
            "message": "Missing semicolon at end of line",
            "level": IssueLevel.ERROR,
            "suggestion": suggestion
        })

    # Clean line for further processing
    clean_line = line.rstrip(';').strip()

    # Split assignment
    if '=' not in clean_line:
        issues.append({
            "code": ISSUE_CODES["assignment"],
            "message": "Invalid assignment syntax (missing =)",
            "level": IssueLevel.ERROR
        })
        return issues

    left, value = [part.strip() for part in clean_line.split('=', 1)]
    tokens = left.split()

    # Parse force keywords and variable name
    force_count = 0
    var_name = None
    valid_force = True
    
    for i, token in enumerate(tokens):
        if token == 'force':
            if var_name is not None:
                issues.append({
                    "code": ISSUE_CODES["force_placement"],
                    "message": "Unexpected 'force' after variable name",
                    "level": IssueLevel.ERROR,
                    "suggestion": f"{' '.join(tokens[:i])} {' '.join(tokens[i+1:])}".strip()
                })
                valid_force = False
            else:
                force_count += 1
        else:
            if var_name is None:
                var_name = token
                remaining_tokens = tokens[i+1:]
                if remaining_tokens:
                    issues.append({
                        "code": ISSUE_CODES["extra_token"],
                        "message": f"Extra tokens after variable name: {' '.join(remaining_tokens)}",
                        "level": IssueLevel.ERROR,
                        "suggestion": f"{' '.join(tokens[:i+1])}"
                    })

    # Validate force count
    if force_count > 2 and valid_force:
        suggestion = f"{'force ' * 2}{' '.join(tokens[force_count:])}"
        issues.append({
            "code": ISSUE_CODES["force_count"],
            "message": f"Too many force keywords ({force_count}), maximum 2 allowed",
            "level": IssueLevel.ERROR,
            "suggestion": suggestion
        })

    # Validate variable name
    if not var_name:
        issues.append({
            "code": ISSUE_CODES["missing_var"],
            "message": "Missing variable name",
            "level": IssueLevel.ERROR
        })
    elif not re.match(r'^[a-zA-Z0-9_]+$', var_name):
        issues.append({
            "code": ISSUE_CODES["invalid_var"],
            "message": f"Invalid variable name format: '{var_name}'",
            "level": IssueLevel.ERROR,
            "suggestion": re.sub(r'[^A-Za-z0-9_]', '_', var_name)
        })

    # Validate value format
    if value:
        # Check boolean values
        if value.lower() in ['true', 'false']:
            if value != value.lower():
                issues.append({
                    "code": ISSUE_CODES["boolean_case"],
                    "message": "Boolean value must be lowercase",
                    "level": IssueLevel.WARNING,
                    "suggestion": value.lower()
                })
        # Check numbers
        elif re.match(r'^-?\d+\.?\d*$', value):
            pass
        # Check arrays
        elif re.match(r'^\[.*\]$', value):
            if not re.match(r'^\[\s*("[^"]*"\s*|\d+\.?\d*\s*)(,\s*("[^"]*"\s*|\d+\.?\d*\s*))*\]$', value):
                issues.append({
                    "code": ISSUE_CODES["value_format"],
                    "message": "Invalid array format",
                    "level": IssueLevel.ERROR
                })
        # Check strings (fixed escaping)
        elif '"' in value or "'" in value:
            if not re.match(r'^"([^"]*)"$', value) and not re.match(r"^'([^']*)'$", value):
                clean_value = value.strip('\'"')
                issues.append({
                    "code": ISSUE_CODES["string_quote"],
                    "message": "Invalid string formatting",
                    "level": IssueLevel.ERROR,
                    "suggestion": f'"{clean_value}"'
                })
        else:
            issues.append({
                "code": ISSUE_CODES["value_format"],
                "message": f"Invalid value format: '{value}'",
                "level": IssueLevel.ERROR,
                "suggestion": f'"{value}"' if ' ' in value else value
            })

    return issues

def lint_file(file_path: Path, repo_root: Path) -> list:
    issues = []
    rel_path = str(file_path.relative_to(repo_root))
    
    with open(file_path, 'r', encoding='utf-8') as f:
        for line_num, raw_line in enumerate(f, 1):
            line_issues = parse_line(raw_line)
            for issue in line_issues:
                entry = {
                    "code": issue["code"],
                    "message": issue["message"],
                    "level": issue["level"].value,
                    "location": {
                        "path": rel_path,
                        "range": {
                            "start": {"line": line_num},
                            "end": {"line": line_num}
                        }
                    }
                }
                if "suggestion" in issue:
                    entry["suggestions"] = [{
                        "text": issue["suggestion"] + (";" if not raw_line.strip().endswith(';') else "")
                    }]
                issues.append(entry)
    return issues

def main():
    parser = argparse.ArgumentParser(description='CBA Config Linter')
    parser.add_argument('config_dir', help='Directory containing .cfg files')
    args = parser.parse_args()

    repo_root = Path(os.environ.get('GITHUB_WORKSPACE', Path.cwd()))
    config_dir = repo_root / args.config_dir

    # Redirect debug output to stderr
    print(f"Checking directory: {config_dir}", file=sys.stderr)  # Changed to stderr
    
    if not config_dir.exists():
        print(f"Error: Config directory not found - {config_dir}", file=sys.stderr)
        sys.exit(1)

if __name__ == '__main__':
    main()

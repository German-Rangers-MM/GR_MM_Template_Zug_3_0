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

def generate_suggestion(original_line: str, error_type: str) -> str:
    line = original_line.rstrip('\n').rstrip(';').strip()
    parts = line.split('=', 1)
    if len(parts) != 2:
        return original_line  # Can't generate suggestion for malformed lines

    left, value = [part.strip() for part in parts]
    tokens = left.split()
    
    # Handle force count suggestions
    if error_type == "force_count":
        valid_force = ' '.join(['force']*2)
        var_part = ' '.join(tokens[2:]) if len(tokens) > 2 else ''
        return f"{valid_force} {var_part} = {value};"
    
    # Handle value format suggestions
    if error_type == "value_format":
        if re.match(r'^\[.*\]$', value) or re.match(r'^-?\d+\.?\d*$', value):
            return original_line  # Valid format, shouldn't reach here
            
        # Add quotes if missing
        if not (value.startswith('"') and value.endswith('"')):
            return f"{left} = \"{value.strip('\"')}\";"
    
    # Handle string quote suggestions
    if error_type == "string_quote":
        return f"{left} = \"{value.strip('\"\')}\";"
    
    # Handle boolean case suggestions
    if error_type == "boolean_case":
        return f"{left} = {value.lower()};"
    
    # Handle semicolon suggestions
    if error_type == "semicolon":
        return f"{line};"
    
    return original_line

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
            "suggestion": generate_suggestion(original_line, "semicolon")
        })

    # Validate force keywords
    force_count = len(re.findall(r'\bforce\b', line.split('=')[0]))
    if force_count > 2:
        issues.append({
            "code": ISSUE_CODES["force_count"],
            "message": f"Too many force keywords ({force_count})",
            "severity": Severity.ERROR.value,
            "suggestion": generate_suggestion(original_line, "force_count")
        })

    # Validate assignment format
    if '=' not in line:
        return issues
    
    left, value = [part.strip() for part in line.split('=', 1)]
    
    # Validate variable name
    var_name = left.split()[-1] if left.split() else None
    if not var_name or not re.match(r'^[a-zA-Z0-9_]+$', var_name):
        issues.append({
            "code": ISSUE_CODES["invalid_var"],
            "message": f"Invalid variable name: {var_name}",
            "severity": Severity.ERROR.value,
            "suggestion": generate_suggestion(original_line, "invalid_var")
        })

    # Validate value format
    if value:
        value = value.rstrip(';').strip()
        if value.lower() in ['true', 'false']:
            if value != value.lower():
                issues.append({
                    "code": ISSUE_CODES["boolean_case"],
                    "message": "Boolean value must be lowercase",
                    "severity": Severity.WARNING.value,
                    "suggestion": generate_suggestion(original_line, "boolean_case")
                })
        elif not (re.match(r'^-?\d+\.?\d*$', value) or 
                 re.match(r'^\[.*\]$', value) or 
                 re.match(r'^".*"$', value)):
            issues.append({
                "code": ISSUE_CODES["value_format"],
                "message": f"Invalid value format: {value}",
                "severity": Severity.ERROR.value,
                "suggestion": generate_suggestion(original_line, "value_format")
            })
            if "'" in value:
                issues.append({
                    "code": ISSUE_CODES["string_quote"],
                    "message": "Use double quotes for strings",
                    "severity": Severity.ERROR.value,
                    "suggestion": generate_suggestion(original_line, "string_quote")
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

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

def debug_log(message: str):
    print(f"[DEBUG] {message}", file=sys.stderr)

def parse_line(raw_line: str, line_num: int) -> list:
    issues = []
    original_line = raw_line.rstrip('\n')
    
    try:
        # Debug: Show raw line being processed
        debug_log(f"Processing line {line_num}: '{original_line}'")

        # Semicolon check
        if not original_line.strip().endswith(';'):
            issues.append({
                "code": ISSUE_CODES["semicolon"],
                "message": "Missing semicolon",
                "level": IssueLevel.ERROR.value
            })

        # Force keyword validation
        force_count = len(re.findall(r'\bforce\b', original_line.split('=')[0]))
        if force_count > 2:
            issues.append({
                "code": ISSUE_CODES["force_count"],
                "message": f"Too many force keywords ({force_count})",
                "level": IssueLevel.ERROR.value
            })

        # Add more validation checks as needed...

    except Exception as e:
        debug_log(f"Error processing line {line_num}: {str(e)}")
    
    return issues

def lint_file(file_path: Path, repo_root: Path) -> list:
    issues = []
    debug_log(f"Checking file: {file_path}")
    
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            for line_num, line in enumerate(f, 1):
                issues.extend(parse_line(line, line_num))
    except Exception as e:
        debug_log(f"Failed to process {file_path}: {str(e)}")
    
    return issues

def main():
    parser = argparse.ArgumentParser(description='CBA Config Linter')
    parser.add_argument('config_dir', help='Directory containing .cfg files')
    args = parser.parse_args()

    repo_root = Path(os.environ.get('GITHUB_WORKSPACE', Path.cwd()))
    config_dir = repo_root / args.config_dir

    debug_log(f"Repository root: {repo_root}")
    debug_log(f"Config directory: {config_dir}")

    if not config_dir.exists():
        debug_log(f"Directory contents: {[p.name for p in repo_root.iterdir()]}")
        print(f"::error::Config directory not found: {config_dir}", file=sys.stderr)
        sys.exit(1)

    all_issues = []
    for cfg_file in config_dir.rglob('*.cfg'):
        all_issues.extend(lint_file(cfg_file, repo_root))

    debug_log(f"Total issues found: {len(all_issues)}")
    
    for issue in all_issues:
        print(json.dumps(issue))

if __name__ == '__main__':
    main()

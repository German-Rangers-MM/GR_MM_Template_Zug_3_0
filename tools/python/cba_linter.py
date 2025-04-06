import os
import re
import sys
from pathlib import Path
from enum import Enum

class IssueLevel(Enum):
    ERROR = "error"
    WARNING = "warning"

def get_relative_path(full_path, repo_root):
    try:
        return str(Path(full_path).relative_to(repo_root))
    except ValueError:
        return full_path

def parse_line(line, repo_root):
    # ... (keep previous parsing logic) ...

def lint_file(file_path, repo_root):
    issues = []
    relative_path = get_relative_path(file_path, repo_root)
    with open(file_path, 'r') as f:
        for line_num, line in enumerate(f, 1):
            raw_line = line.rstrip('\n')
            line_issues = parse_line(raw_line, repo_root)
            for msg, level in line_issues:
                issues.append({
                    'path': relative_path,
                    'line': line_num,
                    'message': msg,
                    'level': level
                })
    return issues

def main():
    parser = argparse.ArgumentParser(description='CBA Config Linter')
    parser.add_argument('config_dir', help='Config directory to lint')
    args = parser.parse_args()
    
    repo_root = Path(os.getenv('GITHUB_WORKSPACE', os.getcwd()))
    config_dir = repo_root / args.config_dir
    
    all_issues = []
    for cfg_file in config_dir.rglob('*.cfg'):
        all_issues.extend(lint_file(cfg_file, repo_root))
    
    # ... (rest of main function) ...

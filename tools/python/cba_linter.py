import argparse
import os
import re
import sys
from enum import Enum

class IssueLevel(Enum):
    ERROR = "error"
    WARNING = "warning"
    INFO = "notice"

def parse_line(line):
    line = line.split('//')[0].strip()
    if not line:
        return []

    issues = []
    
    # Check for missing semicolon (error)
    if not line.endswith(';'):
        issues.append(("Missing semicolon at end of line", IssueLevel.ERROR))
    else:
        line = line[:-1].strip()

    # Split assignment
    parts = line.split('=', 1)
    if len(parts) != 2:
        issues.append(("Invalid assignment syntax (missing =)", IssueLevel.ERROR))
        return issues

    left, value = parts
    left = left.strip()
    value = value.strip()

    # Parse force and variable name
    tokens = left.split()
    force_count = 0
    var_name = None

    for token in tokens:
        if token == 'force':
            if var_name is None:
                force_count += 1
            else:
                issues.append(("Unexpected 'force' after variable name", IssueLevel.ERROR))
        else:
            if var_name is None:
                var_name = token
            else:
                issues.append((f"Extra token '{token}' after variable name", IssueLevel.ERROR))

    # Validate variable name
    if var_name is None:
        issues.append(("Missing variable name", IssueLevel.ERROR))
    elif not re.match(r'^[a-zA-Z0-9_]+$', var_name):
        issues.append((f'Invalid variable name: {var_name}', IssueLevel.ERROR))

    # Validate force count
    if force_count > 2:
        issues.append((f'Too many force keywords: {force_count}', IssueLevel.ERROR))

    # Validate value format
    if value.lower() in ['true', 'false']:
        if value != value.lower():
            issues.append((
                f'Boolean value should be lowercase, suggest: {value.lower()}',
                IssueLevel.WARNING
            ))
    elif not re.match(r'^-?\d+\.?\d*$', value) and not re.match(r'^\[.*\]$', value) and not re.match(r'^".*"$', value):
        issues.append((f'Invalid value format: {value}', IssueLevel.ERROR))

    return issues

def lint_file(file_path):
    issues = []
    with open(file_path, 'r') as f:
        for line_num, line in enumerate(f, 1):
            raw_line = line.rstrip('\n')
            line = raw_line.strip()
            
            if not line or line.startswith('//'):
                continue

            line_issues = parse_line(raw_line)
            for msg, level in line_issues:
                issues.append({
                    'file': file_path,
                    'line': line_num,
                    'message': msg,
                    'level': level
                })
    return issues

def generate_github_annotation(issue):
    return f"::{issue['level'].value} file={issue['file']},line={issue['line']}::{issue['message']}"

def main():
    parser = argparse.ArgumentParser(description='Lint Arma 3 CBA3 server config files with CI/CD integration')
    parser.add_argument('directory', help='Directory containing .cfg files to lint')
    args = parser.parse_args()

    all_issues = []
    for root, dirs, files in os.walk(args.directory):
        for file in files:
            if file.endswith('.cfg'):
                file_path = os.path.join(root, file)
                all_issues.extend(lint_file(file_path))

    error_count = 0
    warning_count = 0

    # Process issues and generate output
    for issue in all_issues:
        print(generate_github_annotation(issue))
        if issue['level'] == IssueLevel.ERROR:
            error_count += 1
        elif issue['level'] == IssueLevel.WARNING:
            warning_count += 1

    # Generate summary
    print(f"\nLint Summary:")
    print(f"Errors: {error_count}")
    print(f"Warnings: {warning_count}")

    # Exit code handling
    if error_count > 0:
        sys.exit(1)
    sys.exit(0)

if __name__ == '__main__':
    main()

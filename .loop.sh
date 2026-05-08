#!/bin/bash
set -e

# Check for input
if [[ -z "$1" ]]; then
  echo "Usage: $0 <iterations>"
  exit 1
fi

# Change < to <= to run full count
for ((i=1; i<=$1; i++)); do
  result=$(opencode --yes -p \
    "@.plan.md @.stat.txt \
    1. Read the .plan.md and .stat.txt file \
    2. Identify the next highest-priority task. \
    3. Implement it, run script/verify.sh, a test for it, and commit changes before pushing \
    4. Update .stat.txt. \
    ONLY DO ONE TASK. If all tasks are done, output <promise>COMPLETE</promise>.")

  echo "$result"

  if [[ "$result" == *"<promise>COMPLETE</promise>"* ]]; then
    echo "Task fully completed after $i loops."
    exit 0
  fi
done

#!/usr/bin/env python
import sys
import subprocess
import re

#TODO: this needs a lot of work:
#- It should (in addition) look through all files referenced in un-pushed commits, and in any stash
#- It should consider files that are staged (even if un-modified) as requiring locking
#- It should defensively look through for any files are are modified but _not_ locked, and lock them if possible
#  - AND ideally complain if we can't get the lock on them
#- I believe we can replace the `--verify` check with `--local` _most_ of the time, which would speed it up
#  considerably for the usual case.
#- Finally, it should have a 'clean-up' mode where it will find any lock-able file that we currently do _not_ have
#  the lock on (this one should _explicitly_ use `--verify`), and verify that it is read-only

# Get all locks. Note that this goes out to the server.
result_locks = subprocess.run(['git', 'lfs', 'locks', '--verify'], capture_output=True)
lock_lines = result_locks.stdout.decode('utf-8').strip().split('\n')

# Pull up all modified files currently in the index
result_lsfiles_unstaged = subprocess.run(['git', 'diff', '--name-only'], capture_output=True)
result_lsfiles_staged = subprocess.run(['git', 'diff', '--name-only', '--cached'], capture_output=True)
modified_files = result_lsfiles_unstaged.stdout.decode('utf-8').strip().split('\n') + result_lsfiles_staged.stdout.decode('utf-8').strip().split('\n')

unlock_files = []

for line in (s.strip() for s in lock_lines):
    # Strip off the username and lock ID off of the end
    line = re.sub('\\s*\t+[^ ]+\\s*\t+ID:\\d+$', '', line)
    # The 'O ' prefix indicates that this is a lock for the current user. It is only
    # present for the `--verify` version. `--local` _should_ only return ones for the
    # current user (need to verify that is actually true...)
    if not line or line[0] != 'O':
        continue
    filename = line[2:].strip()
    if filename not in modified_files:
        unlock_files.append(filename)

if unlock_files:
    subprocess.run(['git', 'lfs', 'unlock'] + unlock_files)

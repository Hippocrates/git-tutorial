#!/bin/sh
source .githooks/find_python3.sh
"$PYTHON3" .githooks/configure_email.py
git lfs install --skip-repo
git config core.hooksPath .githooks

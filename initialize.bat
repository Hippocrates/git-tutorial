call .githooks/find_python3.bat
%PYTHON3% .githooks/configure_email.py
git lfs install --skip-repo
git config core.hooksPath .githooks


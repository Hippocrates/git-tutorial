#!/bin/sh
if test -f '/c/Program Files/Epic Games/UE_5.4/Engine/Binaries/ThirdParty/Python3/Win64/python.exe'; then
  export PYTHON3="/c/Program Files/Epic Games/UE_5.4/Engine/Binaries/ThirdParty/Python3/Win64/python.exe"
elif type python &> /dev/null && python -c "import sys;sys.exit(sys.version_info.major!=3)"; then
  export PYTHON3="python"
  echo "HERE"
elif type python3 &> /dev/null; then
  export PYTHON3="python3"
else
  echo "Error: Could not find an installation of Python3"
  exit 1
fi

# echo "Found python: $PYTHON3"
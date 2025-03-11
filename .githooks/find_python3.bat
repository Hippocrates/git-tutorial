@echo off
if exist "C:\Program Files\Epic Games\UE_5.4\Engine\Binaries\ThirdParty\Python3\Win64\python.exe" (  
  set PYTHON3="C:\Program Files\Epic Games\UE_5.4\Engine\Binaries\ThirdParty\Python3\Win64\python.exe"
) else (
  where python
  if %ERRORLEVEL% == 0 (
    python -c "import sys;sys.exit(sys.version_info.major!=3)"
    if %ERRORLEVEL% == 0 (
	  set PYTHON3="python"
    )
  ) else (
    where python3
    if %ERRORLEVEL% == 0 (
      set PYTHON3="python3"
    )
  )
)

if %PYTHON3%==^%PYTHON3% (
	echo "Error: Could not find a python installation"
	exit /b 1
)

rem echo "Found python: %PYTHON3%"

exit /b 0
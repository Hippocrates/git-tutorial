@echo off
if exist "C:\Program Files\Epic Games\UE_5.4\Engine\Binaries\ThirdParty\Python3\Win64\python.exe" (  
  set PYTHON3="C:\Program Files\Epic Games\UE_5.4\Engine\Binaries\ThirdParty\Python3\Win64\python.exe"
) else (
  where python3
  if %ERRORLEVEL% == 0 (
    set PYTHON3="python3"
  ) else (
    echo "Error: Could not find a python installation"
	exit /b 1
  )
)

rem echo "Found python: %PYTHON3%"

exit /b 0
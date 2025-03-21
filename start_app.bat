@echo off
TITLE Dynamic Therapeutic Games Launcher

:: Check if Python is installed
python --version 2>NUL
if %ERRORLEVEL% NEQ 0 (
    echo Python is not installed or not in PATH. Please install Python 3 to continue.
    pause
    exit /b 1
)

:: Check if pip is installed
pip --version 2>NUL
if %ERRORLEVEL% NEQ 0 (
    echo pip is not installed or not in PATH. Please install pip to continue.
    pause
    exit /b 1
)

:: Check if Ollama is installed
where ollama 2>NUL
if %ERRORLEVEL% NEQ 0 (
    echo Ollama is not installed or not in PATH.
    echo Please install Ollama from https://ollama.ai/
    echo Do you want to continue anyway? (Y/N)
    choice /c YN /m "Continue without Ollama? "
    if %ERRORLEVEL% EQU 2 exit /b 1
)

:: Check if Ollama is running
echo Checking if Ollama is running...
curl -s localhost:11434/api/version >NUL 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Ollama is not running. Attempting to start it...
    start /b Ollama
    
    :: Wait for Ollama to start
    echo Waiting for Ollama to start...
    for /l %%i in (1, 1, 10) do (
        curl -s localhost:11434/api/version >NUL 2>&1
        if %ERRORLEVEL% EQU 0 (
            echo Ollama is now running!
            goto :ollama_running
        )
        
        if %%i EQU 10 (
            echo Could not connect to Ollama. Please ensure it's running before continuing.
            echo Do you want to continue anyway? (Y/N)
            choice /c YN /m "Continue without Ollama? "
            if %ERRORLEVEL% EQU 2 exit /b 1
            goto :ollama_running
        )
        
        echo Waiting... (%%i/10)
        timeout /t 2 >NUL
    )
)

:ollama_running
:: Check for required model
echo Checking for required model gemma3:4b...
ollama list | findstr "gemma3:4b" >NUL
if %ERRORLEVEL% NEQ 0 (
    echo The default model 'gemma3:4b' is not downloaded.
    echo Would you like to download it now? (Y/N)
    choice /c YN /m "Download gemma3:4b now? "
    if %ERRORLEVEL% EQU 1 (
        echo Downloading gemma3:4b (this may take a while)...
        ollama pull gemma3:4b
    ) else (
        echo Without the model, the application may not work properly.
        echo You can pull other models later using 'ollama pull MODEL_NAME'
    )
)

:: Install dependencies
echo Installing dependencies...
pip install -r requirements.txt

:: Create static directory if it doesn't exist
if not exist static mkdir static

:: Start the server
echo Starting server on http://localhost:5000
echo Press Ctrl+C to stop the server

:: Run the app
python server.py 
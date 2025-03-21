# Dynamic Games Application - Setup Guide

## Overview
This application is a Flask-based web server that generates therapeutic 3D games using AI. The games are designed to help users transform negative thoughts into positive ones through an interactive shooter-style game.

## System Requirements
- Python 3.8 or higher
- Internet connection (for model API calls)
- Modern web browser

## Installation

### 1. Create a Virtual Environment

#### On macOS/Linux:
```bash
# Create a virtual environment
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate
```

#### On Windows:
```cmd
# Create a virtual environment
python -m venv venv

# Activate the virtual environment
venv\Scripts\activate
```

### 2. Install Dependencies
With your virtual environment activated, install the required packages:

```bash
pip install -r requirements.txt
```

## Running the Application

### Option 1: Using the Start Scripts

#### On macOS/Linux:
```bash
# Make the script executable (if needed)
chmod +x start_app.sh

# Run the script
./start_app.sh
```

#### On Windows:
```cmd
start_app.bat
```

### Option 2: Manual Start
If you prefer to start the application manually:

```bash
# Activate the virtual environment (if not already activated)
source venv/bin/activate  # macOS/Linux
# OR
venv\Scripts\activate     # Windows

# Start the server
python server.py
```

## LLM Integration Options

The application can generate game content using Ollama, which is the default setting.

### Using Ollama (Default)
1. Install Ollama from [https://ollama.ai/](https://ollama.ai/)
2. Pull the Gemma model using Ollama:
   ```bash
   # Path may vary depending on your installation
   /Applications/Ollama.app/Contents/Resources/ollama pull gemma:7b
   ```
   or with Ollama in your PATH:
   ```bash
   ollama pull gemma:7b
   ```
3. Start Ollama before running the application

## Directory Structure
- `server.py` - The main server application
- `server_optimized.py` - An optimized version of the server
- `requirements.txt` - Python package dependencies
- `start_app.sh` / `start_app.bat` - Startup scripts
- `test_ollama.py` - Test script to check Ollama connectivity
- `static/` - Directory where generated games are saved
- `debug_games/` - Directory for debug copies of games
- `3d_shooter_accepting_being_tired.html` - Template game file

## Configuration
The server runs on port 5000 by default. To change this, modify the port number in `server.py` at the bottom of the file:

```python
app.run(debug=True, port=5000)
```

## Accessing the Application
Once running, access the application in your web browser at:
```
http://localhost:5000
```

## Troubleshooting

### Port Already in Use
If you see an error about the port being in use, either:
- Kill any running instances of the server using `pkill -f "python server.py"`
- Change the port number in server.py
- On macOS, check if AirPlay Receiver is using port 5000 and disable it in System Preferences

### Ollama Connection Issues
If the application can't connect to Ollama:
1. Ensure Ollama is installed and running
2. Run `test_ollama.py` to verify connectivity
3. Check if the model has been pulled (run `ollama list`)

### Python Command Not Found
If you see "command not found: python", try using `python3` instead. 
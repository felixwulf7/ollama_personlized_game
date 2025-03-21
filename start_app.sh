#!/bin/bash

# Check if Python is installed
if ! command -v python3 &> /dev/null
then
    echo "Python 3 is not installed. Please install Python 3 to continue."
    exit 1
fi

# Check if pip is installed
if ! command -v pip3 &> /dev/null
then
    echo "pip3 is not installed. Please install pip3 to continue."
    exit 1
fi

# Check if Ollama is installed
if ! command -v ollama &> /dev/null
then
    echo "Ollama is not installed. Please install Ollama from https://ollama.ai/"
    echo "Do you want to continue anyway? (y/n)"
    read answer
    if [ "$answer" != "y" ]
    then
        exit 1
    fi
fi

# Check if Ollama is running
echo "Checking if Ollama is running..."
if ! curl -s localhost:11434/api/version &> /dev/null
then
    echo "Ollama is not running. Attempting to start it..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        open -a Ollama
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        echo "Please start Ollama manually in another terminal window using 'ollama serve'"
        echo "Press Enter when Ollama is running..."
        read
    elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
        # Windows
        start Ollama
    else
        echo "Could not automatically start Ollama. Please start it manually."
    fi
    
    # Wait for Ollama to start
    echo "Waiting for Ollama to start..."
    for i in {1..10}
    do
        if curl -s localhost:11434/api/version &> /dev/null
        then
            echo "Ollama is now running!"
            break
        fi
        
        if [ $i -eq 10 ]
        then
            echo "Could not connect to Ollama. Please ensure it's running before continuing."
            echo "Do you want to continue anyway? (y/n)"
            read answer
            if [ "$answer" != "y" ]
            then
                exit 1
            fi
        fi
        
        echo "Waiting... ($i/10)"
        sleep 2
    done
fi

# Check for required model
echo "Checking for required model gemma3:4b..."
if ! ollama list | grep -q "gemma3:4b"
then
    echo "The default model 'gemma3:4b' is not downloaded."
    echo "Would you like to download it now? (y/n)"
    read answer
    if [ "$answer" == "y" ]
    then
        echo "Downloading gemma3:4b (this may take a while)..."
        ollama pull gemma3:4b
    else
        echo "Without the model, the application may not work properly."
        echo "You can pull other models later using 'ollama pull MODEL_NAME'"
    fi
fi

# Install dependencies
echo "Installing dependencies..."
pip3 install -r requirements.txt

# Create static directory if it doesn't exist
mkdir -p static

# Start the server
echo "Starting server on http://localhost:5000"
echo "Press Ctrl+C to stop the server"

# Run the app
python3 server.py 
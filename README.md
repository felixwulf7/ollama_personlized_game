# Dynamic Therapeutic Games

A web application that dynamically generates customized therapeutic 3D shooter games based on user input. Users describe what they're struggling with, and the application creates a personalized game experience where players combat negative thoughts with positive, therapeutic affirmations.

## Features

- **Custom Game Generation**: Create personalized therapeutic games based on user input
- **LLM Integration**: Uses Ollama to generate therapeutic content tailored to specific situations
- **Interactive 3D Experience**: Engaging gameplay that helps reframe negative thoughts
- **Multiple Model Support**: Compatible with various LLMs available through Ollama

## Prerequisites

- Python 3.8+
- Ollama (for local LLM inference)
- A web browser with WebGL support

## Installation

1. **Install Ollama**

   Visit [Ollama's website](https://ollama.ai/) to download and install Ollama for your operating system.

2. **Install Python Dependencies**

   ```bash
   # Navigate to the dynamic_games directory
   cd dynamic_games
   
   # Install required packages
   pip install -r requirements.txt
   ```

3. **Pull Required Models**

   ```bash
   # Pull the default model (Gemma 7B)
   ollama pull gemma:7b
   
   # Optionally pull other models
   # ollama pull llama3
   # ollama pull gemma:2b
   ```

## Usage

1. **Start the Server**

   ```bash
   # Navigate to the dynamic_games directory
   cd dynamic_games
   
   # Run the server
   python server.py
   ```

2. **Access the Web Interface**

   Open your web browser and navigate to:
   ```
   http://localhost:5000
   ```

3. **Generate a Custom Game**

   - Enter what you're struggling with in the text area
   - Select an LLM model from the dropdown
   - Click "Generate Custom Game"
   - Wait for the game to be generated
   - Click "Play Your Custom Game" to start playing

## How It Works

1. The user describes what they're struggling with (e.g., "anxiety about job loss")
2. The Flask server sends this input to an LLM via Ollama
3. The LLM generates custom therapeutic content, including:
   - A relevant game title
   - 5 positive affirmations
   - 5 corresponding negative thoughts
4. The server creates a custom HTML game file by modifying the template game
5. The user plays the personalized game, shooting positive thoughts at negative ones

## Game Controls

- **WASD** or **Arrow Keys**: Move
- **Space**: Jump
- **Mouse**: Aim
- **Left Click**: Shoot
- **1-5** or **Click on Text**: Switch between positive thoughts

## Troubleshooting

- **Ollama Not Running**: Ensure Ollama is running in the background
- **Model Not Found**: Use `ollama pull <model_name>` to download required models
- **Server Won't Start**: Check if port 5000 is already in use by another application
- **Game Performance Issues**: Try a smaller browser window or lower resolution

## Customization

- Update the template game path in `server.py` if you move or rename the template game
- Modify the prompt in `generate_with_ollama()` to change how content is generated
- Edit the HTML/CSS in `index.html` to customize the web interface

## License

This project is for educational and therapeutic purposes only. It is not a substitute for professional mental health care. 
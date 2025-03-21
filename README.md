# Ollama Personalized Game

A dynamic therapeutic game generator that creates personalized 3D shooter games to help users transform negative thoughts into positive ones. This application uses Ollama's local LLM capabilities to generate game content based on user input.

## Features

- **Personalized Game Creation**: Create games tailored to your specific challenges or emotional needs
- **Local AI Integration**: Uses Ollama to run LLMs locally on your machine
- **Robust JSON Parsing**: Enhanced error handling and data validation
- **3D Therapeutic Gaming**: Engaging shooter-style game mechanics for transforming negative thoughts
- **Easy Web Interface**: Simple browser-based UI for creating custom games

## Quick Start

1. **Setup the environment**:
   ```bash
   # Clone the repository
   git clone https://github.com/felixwulf7/ollama_personlized_game.git
   cd ollama_personlized_game

   # Create and activate virtual environment
   python3 -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate

   # Install dependencies
   pip install -r requirements.txt
   ```

2. **Setup Ollama**:
   - Install Ollama from [https://ollama.ai/](https://ollama.ai/)
   - Pull the Gemma model: `ollama pull gemma:7b`
   - Start Ollama

3. **Run the application**:
   ```bash
   # On macOS/Linux
   ./start_app.sh

   # On Windows
   start_app.bat
   ```

4. **Access the application**:
   Open your browser and go to `http://localhost:5000`

## How It Works

1. User enters a challenge they're facing (e.g., "anxiety about public speaking")
2. The application sends a prompt to the Ollama-powered LLM
3. The LLM generates personalized game content, including:
   - A meaningful game title
   - 5 positive thoughts/affirmations
   - 5 corresponding negative thoughts to transform
4. The application creates an HTML game file that allows players to "shoot" negative thoughts and replace them with positive alternatives
5. The generated game file is saved and can be accessed and played repeatedly

## Detailed Setup

For detailed setup instructions, see [SETUP.md](SETUP.md).

## Technologies Used

- **Backend**: Python, Flask, Flask-CORS
- **Frontend**: HTML, CSS, JavaScript
- **AI**: Ollama with Gemma model
- **Game Engine**: Custom 3D HTML/JavaScript game

## License

This project is licensed under the MIT License. 
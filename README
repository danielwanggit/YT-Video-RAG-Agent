# YouTube Transcript Knowledge Base with RAG Agent

## Problem Description

This project solves the challenge of extracting and querying knowledge from YouTube videos efficiently. Traditional video consumption requires watching entire videos to find specific information, which is time-consuming and inefficient. This solution creates a searchable knowledge base from YouTube video transcripts, enabling users to ask questions and get precise answers based on the video content.

**Key Features:**
- Automated YouTube video search and transcript extraction
- Vector database storage using Pinecone for semantic search
- RAG (Retrieval-Augmented Generation) agent powered by self-hosted Ollama
- Web-based interface for easy interaction
- Persistent storage of video metadata and transcripts

## Technology Stack

### Core Components
- **n8n**: Workflow automation platform for orchestrating the entire process
- **Ollama**: Self-hosted LLM and embedding model (local inference)
- **Pinecone**: Vector database for storing and retrieving embeddings
- **YouTube Transcript API**: For extracting video transcripts
- **yt-dlp**: YouTube video metadata extraction

### Infrastructure
- **Docker & Docker Compose**: Containerized deployment
- **Custom n8n Image**: Extended with Python dependencies for YouTube processing

### Workflow Architecture
1. **YouTube Search**: Python script using yt-dlp to search and extract video metadata
2. **Transcript Extraction**: Automated transcript retrieval using YouTube Transcript API
3. **Vector Processing**: Text chunking and embedding generation using Ollama
4. **Vector Storage**: Pinecone integration for semantic search capabilities
5. **RAG Agent**: Question-answering using retrieved context and Ollama LLM

## Installation Instructions

### Prerequisites
- Docker and Docker Compose installed
- Ollama installed and running locally
- Pinecone account and API key
- (Optional) Airtable account for metadata tracking

### Ollama Setup

1. **Install Ollama**:
   ```bash
   curl -fsSL https://ollama.ai/install.sh | sh
   ```

2. **Pull Required Models**:
   ```bash
   # For embeddings (recommended: nomic-embed-text)
   ollama pull nomic-embed-text
   
   # For LLM (recommended: llama3.2 or mistral)
   ollama pull llama3.2
   # or
   ollama pull mistral
   ```

3. **Start Ollama Service**:
   ```bash
   ollama serve
   ```

4. **Verify Installation**:
   ```bash
   ollama list
   ```

### Project Setup

1. **Clone the Repository**:
   ```bash
   git clone <your-repo-url>
   cd n8n-docker-compose
   ```

2. **Configure Environment Variables**:
   Create a `.env` file with:
   ```env
   DOMAIN_NAME=your-domain.com
   GENERIC_TIMEZONE=UTC
   ```

3. **Set Up Credentials in n8n**:
   - Pinecone API credentials
   - (Optional) Airtable API credentials
   - Configure Ollama connection settings

4. **Build and Start Services**:
   ```bash
   # Build custom n8n image
   docker build -t n8n-python:1.102.1-7 custom-n8n-image/
   
   # Start services
   docker-compose up -d
   ```

5. **Import Workflow**:
   - Access n8n at `http://localhost:5678`
   - Import the `yt-transcript-agent.json` workflow
   - Configure the Pinecone index and other settings

### Configuration Details

#### Pinecone Setup
1. Create a Pinecone index named `yt-db`
2. Use dimension size compatible with your embedding model (e.g., 768 for nomic-embed-text)
3. Configure the index in the n8n workflow

#### n8n Credentials
- **Pinecone**: API key and environment
- **Ollama**: Local endpoint (typically `http://localhost:11434`)
- **Airtable** (optional): Personal access token

## Demo Video

[Demo video link to be added]

### Usage Example

1. **Access the Web Form**: Navigate to the n8n webhook URL
2. **Enter Your Question**: Type a question about any topic
3. **Specify Video Count**: Choose how many videos to search (1-10)
4. **Submit**: The system will:
   - Search YouTube for relevant videos
   - Extract transcripts automatically
   - Store embeddings in Pinecone
   - Generate answers using the RAG agent

### Sample Queries
- "What is RAG and how does it work?"
- "Explain machine learning basics"
- "How to deploy applications with Docker"

## Project Structure

```
n8n-docker-compose/
├── custom-n8n-image/
│   ├── Dockerfile          # Custom n8n image with Python
│   └── yt_search.py        # YouTube search functionality
├── n8n-workflows/
│   └── yt-transcript-agent.json  # Main workflow
├── n8n_data/               # n8n persistent data
├── docker-compose.yaml     # Service orchestration
├── Makefile               # Build and deployment commands
└── README                 # This file
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

[Add your license information here]

## Support

For issues and questions:
- Create an issue in the GitHub repository
- Check the n8n documentation for workflow-specific questions
- Refer to Ollama documentation for model-related issues
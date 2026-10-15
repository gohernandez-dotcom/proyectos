# Production Dockerfile for TEMIS Web Flow (Reflex + FastAPI)
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y curl git unzip build-essential && rm -rf /var/lib/apt/lists/*

# Install Node.js (required by Reflex for Next.js compilation)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && apt-get install -y nodejs

# Copy requirements and install python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir reflex

# Copy application source code
COPY . .

# Initialize and compile Reflex app
RUN python -m reflex init
RUN python -m reflex export --no-zip

# Expose web port
EXPOSE 10000

# Start Reflex with production lightweight ASGI server (<50MB RAM)
CMD ["python", "prod_server.py"]
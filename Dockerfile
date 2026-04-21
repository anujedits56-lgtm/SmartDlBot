# Base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies (IMPORTANT)
RUN apt-get update && apt-get install -y \
    ffmpeg \
    curl \
    gcc \
    g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . .

# Upgrade pip (VERY IMPORTANT for Render)
RUN pip install --upgrade pip

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Environment
ENV PYTHONUNBUFFERED=1

# Expose port (Flask)
EXPOSE 5000

# Start app
CMD ["python", "main.py"]

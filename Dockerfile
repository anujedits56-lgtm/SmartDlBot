# Base image
FROM python:3.10

# Set working directory
WORKDIR /app

# Install system dependencies (ffmpeg + nodejs for yt-dlp)
RUN apt-get update && \
    apt-get install -y ffmpeg nodejs npm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Disable python buffering (important for logs)
ENV PYTHONUNBUFFERED=1

# Expose port (optional)
EXPOSE 5000

# Run bot
CMD ["python", "main.py"]

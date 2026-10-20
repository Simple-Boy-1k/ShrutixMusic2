FROM nikolaik/python-nodejs:python3.10-nodejs20

WORKDIR /app

# Install FFmpeg using Debian package manager
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app/

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Start the music bot
CMD ["bash", "start"]

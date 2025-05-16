FROM ubuntu:20.04

# Set noninteractive install
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt update && \
    apt install -y ffmpeg curl && \
    apt clean

# Copy files
WORKDIR /app
COPY . .

# Make the start script executable
RUN chmod +x start.sh

# Run the script
CMD ["./start.sh"]

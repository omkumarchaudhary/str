#!/bin/bash

while true
do
  echo "Starting low-bitrate stream..."

  ffmpeg \
    -re -loop 1 -framerate 1 -i background.jpg \
    -stream_loop -1 -i music.mp3 \
    -c:v libx264 -preset ultrafast -tune stillimage \
    -b:v 40k -maxrate 40k -bufsize 80k \
    -s 426x240 \
    -c:a aac -b:a 48k \
    -f flv "rtmp://x.rtmp.youtube.com/live2/6y98-mazq-py6b-kayt-dzz2"

  echo "Stream ended. Restarting in 10 seconds..."
  sleep 10
done


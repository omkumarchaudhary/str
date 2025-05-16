#!/bin/bash

while true
do
  echo "Starting stream..."

  ffmpeg \
    -re -loop 1 -framerate 30 -i background.jpg \
    -stream_loop -1 -i music.mp3 \
    -s 1280x720 \
    -c:v libx264 -preset veryfast -tune stillimage \
    -pix_fmt yuv420p \
    -c:a aac -b:a 128k -ar 44100 \
    -f flv \
    -maxrate 3000k -bufsize 6000k \
    -g 60 \
    "rtmp://x.rtmp.youtube.com/live2/6y98-mazq-py6b-kayt-dzz2"

  echo "Restarting in 10 seconds..."
  sleep 10
done

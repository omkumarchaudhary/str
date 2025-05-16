#!/bin/bash

while true
do
  echo "Starting stream..."
  ffmpeg \
    -re -loop 1 -framerate 2 -i background.jpg \
    -stream_loop -1 -i music.mp3 \
    -c:v libx264 -preset veryfast -tune stillimage \
    -c:a aac -b:a 128k \
    -shortest \
    -f flv "rtmp://x.rtmp.youtube.com/live2/6y98-mazq-py6b-kayt-dzz2"

  echo "Restarting in 10 seconds..."
  sleep 10
done

#!/bin/bash

while true
do
  echo "Starting stream..."

  ffmpeg \
    -re -loop 1 -framerate 30 -i background.jpg \         # 30 FPS for smooth video
    -stream_loop -1 -i music.mp3 \                        # loop audio infinitely
    -c:v libx264 -preset veryfast -tune stillimage \     # encode video fast & optimized for still images
    -pix_fmt yuv420p \                                    # pixel format compatible with YouTube
    -c:a aac -b:a 128k -ar 44100 \                        # AAC audio with standard sample rate
    -f flv \
    -maxrate 3000k -bufsize 6000k \                       # control bitrate to avoid spikes
    -g 60 \                                               # GOP size, 2 sec keyframes at 30fps (good for streaming)
    "rtmp://x.rtmp.youtube.com/live2/6y98-mazq-py6b-kayt-dzz2"

  echo "Restarting in 10 seconds..."
  sleep 10
done



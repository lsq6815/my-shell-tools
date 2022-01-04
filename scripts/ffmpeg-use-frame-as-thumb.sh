#!/usr/bin/bash
ffmpeg -ss "$2" -i "$1" -frames:v 1 tmp.png -y
# require FFmpeg 4.0, released Apr 20 2018 or newer
ffmpeg -i "$1" -i tmp.png -map 1 -map 0 -c copy -disposition:0 attached_pic out.mp4 -y

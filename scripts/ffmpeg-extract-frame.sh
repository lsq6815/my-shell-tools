#!/usr/bin/bash
ffmpeg -i "$1" -ss "$2" -vframes 0 out.png

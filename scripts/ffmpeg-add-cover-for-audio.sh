#!/usr/bin/bash
extension=${1##*.}
stem=${1%.*}
output="${stem}.covered.${extension}"

ffmpeg \
    # input audio
    -i "$1" \
    # input cover image
    -i "$2" \
    -map 0:a -map 1 -c copy \
    -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)" \
    -disposition:v attached_pic \
    "${stem}.covered.${extension}"


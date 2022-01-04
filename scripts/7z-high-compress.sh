#!/usr/bin/bash
# 7z configure for high rate compression
7z a -t7z -m0=lzma2 -mx=9 -aoa -mfb=64 -md=32m -ms=on "${1}.7z" "$1"

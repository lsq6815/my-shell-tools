#!/bin/bash
################################
# 列出 Size 最大的几个 Package #
################################

dpkg-query --show --showformat='${Installed-Size}\t${Package}\n' |
sort -rh |
head -"${1:-10}" |
awk '{print $1/1024 "MB", $2}' |
column -t


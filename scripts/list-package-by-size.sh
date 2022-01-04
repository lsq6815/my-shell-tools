#!/bin/bash
################################
# 列出 Size 最大的几个 Package #
################################

num="${1:-10}" # 默认的行数为 10

dpkg-query --show --showformat='${Installed-Size}\t${Package}\n' |
sort -rh |
head -$num |
awk '{print $1/1024 "MB", $2}' |
column -t


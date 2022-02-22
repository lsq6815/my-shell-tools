#!/usr/bin/bash

# global constants
readonly VERSION="0.1.0" # using semantic versioning
readonly AUTHOR="LSQ"
readonly EMAIL="lsq6815@gmail.com"
readonly HELP_INFO=$(cat <<END
Statists directory by file suffix
Usage: ${0##*/} [directory]
    if directory is omited, "." is given as directory

Options:
    -v, --version : display version
    -h, --help    : display this info

Version: $VERSION 
Copyright: $AUTHOR - $EMAIL
END
)

die() {
    echo "$1"
    exit 1
}

# options parsing
while [[ "$1" =~ ^- && "$1" != "--" ]]; do
    case $1 in
        -v | --version )
            echo "$VERSION"
            exit
            ;;
        -h | --help )
            echo "$HELP_INFO"
            exit
            ;;
    esac
    shift
done
# remove --
[[ "$1" == '--' ]] && shift

DIR=${1:-.}

find "$DIR" -type f |
    extension |
    sort |
    uniq --count |
    sort -nrk1


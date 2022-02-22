#!/usr/bin/bash

####################################################
# Check if a image's suffix (extension) is correct #
####################################################

readonly VERSION="0.1.1"
readonly AUTHOR="LSQ"
readonly EMAIL="lsq6815@gmail.com"
readonly HELP_INFO=$(cat <<END
Check Image Suffix
Usage: ${0##*/} [options] img1 [img2, [img3, ...]]

Options:
    -v, --version : display version
    -h, --help    : display this info
    -t, --test    : no output, but set exit code to 0 iff img has the correct suffix
    -a, --add     : add suffix if img hasn't, not work in test mode
    -c, --correct : correct suffix if it is wrong, not work in test mode
    -w, --wrong   : only print the image with wrong suffix, override test mode, and normal mode

Version: $VERSION 
Copyright: $AUTHOR - $EMAIL
END
)

# options
Test=""
Add=""
Correct=""
Wrong=""

################################################################################
# die in the perl favor
# Arguments:
#     $1: error message
# Outputs:
#     error message
# Returns:
#     exit with 1
################################################################################
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
        -t | --test )
            Test="Test"
            ;;
        -a | --add )
            Add="Add"
            ;;
        -c | --correct )
            Correct="Correct"
            ;;
        -w | --wrong )
            Wrong="Wrong"
            ;;
        # panic is option is unknown
        * )
            die "Unknown opton $1, exit"
            ;;
    esac
    shift
done
# remove --
[[ "$1" == '--' ]] && shift

# Output image with wrong suffix
if [[ "$Wrong" ]]; then
    for img in "$@"; do
        suffix=${img##*.}
        full_type=$(file -ib "$img" | cut -d';' -f1)
        max_type=${full_type%/*}
        min_type=${full_type#*/}

        # process jpeg and jpg unification
        [[ "$suffix" == "jpeg" && "$min_type" == "jpg" ]] && min_type="jpeg"
        [[ "$suffix" == "jpg" && "$min_type" == "jpeg" ]] && min_type="jpg"
        
        [[ "$max_type" != "image" ]] && continue
        [[ -z "$suffix" ]] && continue
        [[ "$suffix" == "$min_type" ]] && continue
        echo "[$img] $suffix -> $min_type"
    done
    exit
fi

for img in "$@"; do
    suffix=${img##*.}
    full_type=$(file -ib "$img" | cut -d';' -f1)
    max_type=${full_type%/*}
    min_type=${full_type#*/}

    # process jpeg and jpg unification
    [[ "$suffix" == "jpeg" && "$min_type" == "jpg" ]] && min_type="jpeg"
    [[ "$suffix" == "jpg" && "$min_type" == "jpeg" ]] && min_type="jpg"
    
    if [[ "$max_type" != "image" ]]; then
        [[ "$Test" ]] && exit 1
        echo "[$img]: unknown image type: $full_type"
        continue
    fi

    if [[ -z "$suffix" ]]; then
        [[ "$Test" ]] && exit 1
        if [[ "$Add" ]]; then
            newName="${img%.*}.${min_type}"
            mv "$img" "$newName"
            echo "[$img] add suffix as: $newName"
            continue
        fi
        echo "[$img] hasn't the suffix!"
        continue
    fi

    if [[ "$suffix" == "$min_type" ]]; then
        [[ "$Test" ]] && exit
        echo "[$img] has the correct suffix"
    else
        [[ "$Test" ]] && exit 1
        if [[ "$Correct" ]]; then
            newName="${img%.*}.${min_type}"
            mv "$img" "$newName"
            echo "[$img] correct suffix as: $newName"
            continue
        fi
        echo "[$img] has the incorrect suffix: $suffix, the correct suffix is: $min_type"
    fi
done

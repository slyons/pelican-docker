#!/bin/bash

DEBUG="${DEBUG:-0}"

if [ ! "$DEBUG" -eq "1" ];
then
    set -o errexit
    set -o pipefail
    set -o nounset
fi

/home/app/pre.sh
exec "$@" || /home/app/post.sh
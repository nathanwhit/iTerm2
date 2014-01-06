#!/bin/bash
if [ $# -ne 1 ]; then
  echo "Usage: download.sh filename"
  exit 1
fi
if [ -a $1 ]; then
  printf '\033]50;BeginFile='$1'\n'
  stat -c%s $1
  printf '\a'
  base64 < $1
  printf '\033]50;EndFile\a'
  exit 0
fi

echo File $1 does not exist.
exit 1

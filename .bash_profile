#!/bin/bash

echo "Hello $(whoami)"

#export COURSE_ID="DevOpsTheHardWay"
export COURSE_ID="__REPO_NAME__"
umask 660
FILE="/home/$USER/.token"
if [ -f "$FILE" ]; then
# echo "$FILE does exist in your system"

  if [ $(stat -c "%a" "$FILE") -ne 600 ]; then
    echo "Warning: .token file has too open permissions"
  fi
fi

export PATH="/home/$USER/usercommands:$PATH"
date -u +%Y-%m-%dT%H:%M:%S

echo "alias ltxt='ls *.txt'" >> ~/.bashrc
TEMPDIR=~/tmp

if [[ -d ~/tmp ]]; then
  rm -rf "${TEMPDIR:?}/"*
else
mkdir "$TEMPDIR"
fi

# Check if any process is using port 8080
PID=$(lsof -t -i :8080)

if [ -n "$PID" ]; then
    echo "Killing process $PID bound to port 8080..."
    kill "$PID"
    echo "Process killed."
else
    echo "No process found bound to port 8080."
fi




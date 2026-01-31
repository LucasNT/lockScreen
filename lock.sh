#!/usr/bin/env sh


if ! command -v swaylock > /dev/null 2>&1
then
  echo "This script need the swaylock to run"
  exit 1
fi

(
    flock -n 200 || exit 0
    COLOR=$(shuf -i 0-16777215 -n 1)

    swaylock -c $(printf "%x" $COLOR)

) 200>/tmp/lockScreen.lock

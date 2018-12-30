#! /bin/bash
#
# mpd_status.sh
# Copyright (C) 2018 turbo <turbo@devbox>
#
# Distributed under terms of the MIT license.
#

playing=
paused=
stopped=

status=$(mpc status | sed -n 's/^\[\([^])]*\)\].*$/\1/p')
case $status in
  playing) echo -n $playing ;;
  paused)  echo -n $paused  ;;
  *)       echo -n $stopped ;;
esac

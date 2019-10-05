#! /bin/sh
#
# ext_screen.sh
# Copyright (C) 2019 turbo <turbo@turbo-pc>
#
# Distributed under terms of the MIT license.
#

monitor='DP1'
laptop='eDP1'

extDisplay(){
  local isExit=$(xrandr --listactivemonitors | grep '+DP1')
  if [ -n "$isExit" ]; then
    echo "关闭扩展屏"
    xrandr --auto --output "$monitor" --right-of eDP1 --off 
  else
    echo "开启扩展屏"
    xrandr  --output "$monitor" --rotate right --left-of eDP1 --mode 1920x1080
  fi
}

extDisplay


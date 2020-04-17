#!/bin/bash
# File              : ext_screen.sh
# Author            : turbo
# Date              : 17.04.2020
# Last Modified Date: 17.04.2020
# Last Modified By  : turbo
#! /bin/sh
#
# ext_screen.sh
# Copyright (C) 2019 turbo <turbo@turbo-pc>
#
# Distributed under terms of the MIT license.
#


extDisplay(){
  local localtion=$1
  local rotate=$2

  local monitorCount=$(xrandr --listactivemonitors| grep Monitors|cut -d':' -f2)
  local displayPort=$(xrandr --prop | grep -v  disconnected | grep connect | grep -v primary | cut -d' ' -f1)
  if [[ -z $displayPort ]]; then
    if [ $monitorCount -eq 2 ]; then
      displayPort=$(xrandr --listactivemonitors |grep -v eDP1 | tail -fn1|cut -d' ' -f6)
      notify-send " reset之前的扩展屏"
    else
      notify-send " 扩展屏线未连接上"
      exit -1
    fi
  fi
  echo "检测 monitor数量 ${monitorCount}, ${displayPort}"
  if [ $monitorCount -eq 1 ] && [ -n $displayPort ]; then
    local dpi=$(xrandr | grep -A 1 $displayPort |tail -n1 | cut -d ' ' -f4)

    echo "开启扩展屏"
    echo "xrandr --output $displayPort --rotate $rotate --$localtion-of eDP1 --mode $dpi"
    if [[ -e "$rotate" ]]; then
      xrandr --output $displayPort --rotate $rotate --$localtion-of eDP1 --mode $dpi
    else
      xrandr --output $displayPort --$localtion-of eDP1 --mode $dpi
    fi
  else
    echo "关闭扩展屏"
    echo "xrandr --auto --output $displayPort --$localtion-of eDP1 --off"
    xrandr --auto --output $displayPort --$localtion-of eDP1 --off
  fi
}

#default value

localtion='right'
#rotate='left'
rotate=''

if [ "$#" -gt 0 ] && [ ! -z "$1" ] && [! -z "$2" ]; then
  localtion=$1
  rotate=$2
fi


extDisplay $localtion $rotate

#! /bin/sh
#
# light.sh
# Copyright (C) 2019 turbo <turbo@turbo-pc>
#
# Distributed under terms of the MIT license.
#
if [ "$1" = "up" ];then
	/usr/bin/xbacklight -inc $2
	notify-send " $(xbacklight -get | awk '{printf "%.0f\n", $1}')% up"
else
	/usr/bin/xbacklight -dec $2
	notify-send " $(xbacklight -get | awk '{printf "%.0f\n", $1}')% down"
fi


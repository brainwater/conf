#!/bin/bash

if [[ "$(uname -n)" == "blake-ubuntu-desktop" ]]
then
	xrandr --output DVI-0 --auto --primary --output VGA-0 --auto --right-of DVI-0
fi


#!/bin/bash
set -e

if [[ ! -x "$(command -v gconftool-2)" ]] || [[ "$XDG_CURRENT_DESKTOP" != *XFCE ]]
then
	exit 1
fi

background=""
foreground=""

case "$1" in
	'ZorinBlue-Light' | 'ZorinGreen-Light' | 'ZorinRed-Light' | 'ZorinOrange-Light' | 'ZorinPurple-Light' | 'ZorinGrey-Light')
		background='#FFFFFF'
		foreground='#333333'
		;;

	'ZorinBlue-Dark')
		background='#191f22'
		foreground='#bde6fb'
		;;

	'ZorinGreen-Dark')
		background='#141a19'
		foreground='#b0f0df'
		;;

	'ZorinRed-Dark')
		background='#1a0b0a'
		foreground='#e35d5d'
		;;

	'ZorinOrange-Dark')
		background='#221913'
		foreground='#febc8d'
		;;

	'ZorinPurple-Dark')
		background='#161218'
		foreground='#d6aeed'
		;;

	'ZorinGrey-Dark')
		background='#1b1b1b'
		foreground='#ffffff'
		;;

	*)
		exit 0
		;;
esac

if [[ -n "$background" && -n "$foreground" ]]
then
	gconftool-2 --type string --set /apps/dockbarx/theme Zorin
	gconftool-2 --type string --set /apps/dockbarx/themes/Zorin/popup_style_file Zorin.tar.gz

	gconftool-2 --type string --set /apps/dockbarx/themes/Zorin/color1 "$background"
	gconftool-2 --type string --set /apps/dockbarx/themes/Zorin/color2 "$foreground"
	gconftool-2 --type string --set /apps/dockbarx/themes/Zorin/color4 "$foreground"
	gconftool-2 --type string --set /apps/dockbarx/themes/Zorin/color5 "$foreground"
fi

exit 0

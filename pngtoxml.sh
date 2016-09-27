#!/bin/bash
: '
Author - SohamJ

Credits -
	Potrace
	a-student

This script converts a png to vector drawable. 
Usage - ./pngtoxml.sh filename.png

Dependencies - 

potrace, mono-runtime, wine, inkscape

Download the svg to xml tool by a-student from https://github.com/a-student/SvgToVectorDrawableConverter/releases/tag/v1.3
Extract the zip 

Run this command once on terminal
exec /usr/bin/mono $MONO_OPTIONS "/usr/lib/mono/4.5/mod-mono-server4.exe" "$@"
'

filename=$(basename "$1")
filename="${filename%.png}"

echo $filename

eval "pngtopnm -mix $1 > "$filename.pnm" "
eval "potrace "$filename.pnm" -s -o "$filename.svg" "
eval "rm "$filename.pnm" "
eval "mono svg2vd.exe --no-update-check -i "$filename.svg" "
eval "rm "$filename.svg" "

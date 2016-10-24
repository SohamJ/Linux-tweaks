#!/bin/bash

#Fetch the latest TBO arm zip file
TBO_VERSION=$(wget http://teamblackedout.com/Gapps -q -O - |  awk -F '"' '/\<a href=\"GoogleApps-ThemeReady-LP-MM-N-v[0-9][0-9].[0-9].zip/ {print $2}' | sort -r | head -1)

#Download the zip if not present
wget -nc http://teamblackedout.com/Gapps/$TBO_VERSION

#unzip the zip to a temp directory
unzip "$TBO_VERSION" -d tbo

#Make a dir to keep the gapps
mkdir -p Gapps

#Move the apks to Gapps/
for i in $(find tbo -type f -name "*.apk"); do
	mv $i Gapps/
done

#Ask the user to keep or remove the extracted zip folder
echo "Remove the extracted tbo zip? y/n"
read input

if [[ $input == 'y' ]]; then
	rm -rf tbo
fi

#Decompile apks
for i in $(find Gapps -type f -name "*.apk"); do
	apktool d $i
done

#!/bin/bash

#This script outputs the new xml resources (hence changelog) on stdout.

#The function whatsnew is in my bashrc, you can find it in the Bashrc file in the root of this repo
source ~/.bashrc

for i in `whatsnew $1 $2`; do
	grep "name=\"$i\"" $2 | sort  --parallel=2
done

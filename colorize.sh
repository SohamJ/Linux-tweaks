#Author - Soham

#This script batch converts a specific color found in all the pngs to user-specified color.
#Usage - ./colorize.sh <path> <Color you want in hex> <Current color in hex>
#eg. Changing a teal png to white one ./colorize <path> FFFFFF 009688

#The Fuzz value defines how close you want to close to the current color. Default is 20

#This script is only for changing the fill color. Background/transparency changes have different commands that
# you can check in man

folder=$1
for i in $(find $folder -name '*.png'); do
	new=$(echo $2)
	current=$(echo $3)
	convert $i -fuzz 20% -fill \#"$new" -opaque \#"$current" "$i"		
done

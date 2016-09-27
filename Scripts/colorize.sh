#Author - Soham

#This script batch converts a specific color found in all the pngs to user-specified color.
#Usage - ./colorize.sh <path> <filename> <Color you want in hex> <Current color in hex> <fuzzvalue>
#eg. Changing a teal png to white one ./colorize ~/soham/theme/res/ abc-*.png FFFFFF 009688 80

#The Fuzz value defines how close you want to close to the current color. Default is 40

#This script is only for changing the fill color. Background/transparency changes have different commands that
# you can check in man

if [[ "$#" -lt 4 ]]; then
    echo "Illegal number of parameters"
    echo "Usage : ./colorize.sh <path> <filename> <Color you want in hex> <Current color in hex> <fuzzvalue>"
    exit 1
fi

foldername=$1
filename=$(echo $2)

if [[ $5 == "" ]]; then
	fuzz=40
else
	fuzz=$(echo $5)
fi

for i in $(find $foldername -name $filename); do
	new=$(echo $3)
	current=$(echo $4)
	convert $i -fuzz "$fuzz"% -fill \#"$new" -opaque \#"$current" "$i"		
done

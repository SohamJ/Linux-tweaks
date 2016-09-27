#This script is to copy files which contain the pattern you want to a location you want
#Eg. I want to move all files in dirA that contain "abc" and move it to dirB
#Usage - ./copygrepfiles.sh "abc" dirA dirB


if [[ $3 == "" ]]; then
	echo "no destination"
	exit 1
	
elif [[ $2 == "" ]]; then
	echo "no source"
	exit 1

elif [[ $1 == "" ]]; then
	echo "no pattern"
	exit 1
fi

for i in $(grep -i -r -l "$1" $2); do
cp "$i" "$3/"
#echo "$2/$i"
done

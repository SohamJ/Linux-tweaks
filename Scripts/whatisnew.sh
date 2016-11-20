source ~/.bashrc

#Similar to whatsnew but shows the whole line of the resource
for i in `whatsnew $1 $2` ; do
	awk '/\<'$i'\>/ {print $0}' $2
done


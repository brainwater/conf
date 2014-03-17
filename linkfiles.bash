#!/bin/bash
# links the files in this repository based on the dotfilelist.txt file

# current directory of script
scriptdir="$(readlink -f "$(dirname "${0}")")"
dotfilelist="${scriptdir}/dotfilelist.txt"

repoprefix="conf"

if [ ! -e "${dotfilelist}" ]
then
	echo "ERROR: No dotfilelist.txt at ${dotfilelist}, exiting"
	exit 1
fi

grep -v "^#" "${dotfilelist}" | while read p; do
	# Properly format dotpath (linkname) and conffile (link target)
	conffile="${repoprefix}/$(echo "${p}" | cut -d " " -f 1)"
	dotfile="$(echo "${p}" | cut -d " " -f 2)"
	res="${dotfile//[^\/]}"
	for i in $(seq "${#res}")
	do
		conffile="../${conffile}"
	done
	dotpath="${HOME}/${dotfile}"
	#echo "conf target: ${conffile}"
	#echo "dot path link name: ${dotpath}"

	# Check if link already exists
	if [ -e "${dotpath}" ]
	then
		if [ ! "$(readlink "${dotpath}")" == "${conffile}" ]
		then
			echo "WARNING: File already exists ${dotpath} remove in order to link"
		fi
	else
		# Insert link
		echo "Inserting link target: ${conffile} name: ${dotpath}"
		ln -s "${conffile}" "${dotpath}"
	fi
done

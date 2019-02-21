#!/bin/bash

NUM=$(( $1 - 1 ))
NAME=$2
DIR=$3
TEXT=$4

while true; do
	if [ -d $DIR ]; then
		for i in $(seq 0 ${NUM}); do
			touch ${DIR}${NAME}${i}
			echo "$TEXT" > ${DIR}${NAME}${i}
		done
		break
	else
		echo "$DIR is not valid directory."
		echo -n "Do you want to create directory $DIR? (Yes/no) "; read OPT
		case $OPT in
			Y|y|yes|YES|Yes ) mkdir $DIR; continue ;;
			N|n|no|NO|No ) echo "Pick an existing directory."; break ;;
			* ) mkdir $DIR; continue ;;
		esac
	fi
done

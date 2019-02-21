#!/bin/bash

NUM=$(( $1 - 1 ))
NAME=$2
DIR=$3
TEXT=$4

if [ ! -d $DIR ]; then
	echo "$DIR is not valid directory."
	echo -n "Do you want to create directory $DIR? (Yes/no) "; read OPT
	case $OPT in
		Y|y|yes|YES|Yes ) mkdir $DIR ;;
		N|n|no|NO|No ) echo "Pick an existing directory." ;;
		* ) mkdir $DIR ;;
	esac
fi	

for i in $(seq 0 ${NUM}); do
	touch ${DIR}${NAME}${i}
	echo "$TEXT" > ${DIR}${NAME}${i}
done


#!/bin/bash

DIR=$1

if [ -d $DIR ]; then
	FILES=$(ls -p $DIR)
	for i in ${FILES[@]}; do
		cat $i
	done
else
	echo "ERROR: $DIR is not directory."
fi

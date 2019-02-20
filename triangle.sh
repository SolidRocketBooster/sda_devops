#!/bin/bash



for i in $(seq 1 $1) ; do
	for j in $(seq 1 $i) ; do
		echo -n "$2"
		((j++))
	done
	echo
	((i++))
done

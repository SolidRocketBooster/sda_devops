#!/bin/bash

NUM=($@)
MIN=${NUM[0]}

for i in $(seq 0 ${#NUM}) ; do
	if [ ${NUM[i]} -lt ${MIN} ]; then
		MIN=${NUM[i]}
	fi
done

echo $MIN

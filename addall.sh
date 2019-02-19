#!/bin/bash

NUM=$(cat $1)

for i in $NUM; do
	SUM=$(( ${SUM}+${i} ))
done

echo $SUM

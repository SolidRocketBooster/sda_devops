#!/bin/bash
FILES=$(ls $1)

for f in $FILES; do
	CONSOLIDATE="${CONSOLIDATE}${f}"
done
cat $CONSOLIDATE

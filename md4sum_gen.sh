#!/bin/bash
FILES=$(ls $1)
OUTPUT=$2

for f in $FILES; do
	md5sum $f >> $OUTPUT
done

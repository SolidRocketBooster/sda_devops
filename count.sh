#!/bin/bash
WORD=$1
FILE=$2

echo $(grep -o -i $WORD $FILE | wc -l)

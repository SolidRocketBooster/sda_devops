#!/bin/bash

echo "Podaj temperature (format ##C/F e.g 45F, 30C)"
read TEMP

TEMP_L=${#TEMP}
TEMP_N_L=$((${TEMP_L}-1))
TEMP_N=${TEMP:0:${TEMP_N_L}}
CONV=${TEMP:(-1)}

case $CONV in
	F ) TEMP_V=$((${TEMP_N}-32*5/9)) ; UNIT="C" ;; 
	C ) TEMP_V=$((${TEMP_N}*9/5+32)) ; UNIT="F" ;;
esac



echo "to ${TEMP_V}${UNIT}"

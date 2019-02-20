#!/bin/bash

TEMP=$(( RANDOM % 10 + 1 ))
echo "O jakiej liczbie od 1 do 10 myle?"
read NUM

while true; do
	if [[ ${TEMP} -eq ${NUM} ]]; then
		echo "Brawo! Liczba, o której mylalem to dokladnie ${TEMP}. Dobry strzal!"
		break
	else
		echo "Niestety pudlo. Mylalem o liczbie inniej liczbie. Spróbuj ponownie."
		read NUM
	fi
done

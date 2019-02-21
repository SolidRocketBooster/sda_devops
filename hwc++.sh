#!/bin/bash

cat >> $1 << EOL
#include <stdio.h>
int main() { 
printf("Hello ${2}!\n");
return 0; 
}
EOL
gcc $1
./a.out
rm -rf $1
rm -rf a.out

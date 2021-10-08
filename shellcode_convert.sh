#!/usr/bin/env bash

# Created by m4niac-0x from iMilnb

##### GLOBAL VARS #####

TARGET="$1"


##### FUNCTIONS #####

littleEndian_convert () {
	echo $1 | rev | dd conv=swab 2>/dev/null
}

bigEndian_2_shellcode () {
	littleEndian_convert $1 | sed -E 's/../&\\x/g;s/^(.+)\\x$/\\x\1/'
}


##### EXECUTION #####

bigEndian_2_shellcode $1
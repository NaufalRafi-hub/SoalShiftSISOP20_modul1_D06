#!/bin/bash 


if [[ $1 =~ ^[a-zA-Z]+$ ]]
then
	</dev/urandom tr -dc 'A-Za-z0-9' | head -c 28 > /home/rafi/log/$1.txt
else 
	echo "tidak boleh angka"
fi

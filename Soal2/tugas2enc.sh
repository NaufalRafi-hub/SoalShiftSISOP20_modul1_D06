
#!/bin/bash 

#chr() {
#  [ "$1" -lt 256 ] || return 1
#  printf "\\$(printf '%03o' "$1")"
#}

#if [[ $1 =~ ^[a-zA-Z]+$ ]]
#then

input=$1

jam=`date "+%H"`

#x= `chr "$jam"`

upcase=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")
lowcase=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z")

batas1=${upcase[jam]}
batas2=${upcase[jam-1]}
batas3=${lowcase[jam]}
batas4=${lowcase[jam-1]}

output=$(echo "$1" | tr '[A-Za-z]' ["$batas1"-ZA-"$batas2""$batas3"-za-"$batas4"])

#</dev/urandom tr -dc 'A-Za-z0-9' | head -c 28 > /home/rafi/log/$output.txt
mv $input.txt $output.txt

#else 
#	echo "tidak boleh angka"
#fi







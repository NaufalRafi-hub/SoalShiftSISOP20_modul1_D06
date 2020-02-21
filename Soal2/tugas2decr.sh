
#!/bin/bash 
#untuk mengetahui inputan yang ingin di decrypt
input=$1
#untuk mengetahui kpaan file terakhir di modifikasi
jam=`date -r $input "+%H"`
#agar file yang diinputkan berbentuk .txt
file="${input%.txt}"
#echo $jam

#jam=`date "+%H"`

upcase=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")
lowcase=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z")

batas1=${upcase[26-jam]}
batas2=${upcase[26-jam-1]}
batas3=${lowcase[26-jam]}
batas4=${lowcase[26-jam-1]}

output=$(echo "$file" | tr '[A-Za-z]' ["$batas1"-ZA-"$batas2""$batas3"-za-"$batas4"])

mv $input $output.txt








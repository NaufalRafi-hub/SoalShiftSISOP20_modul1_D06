#!bin/bash/

for((i=1; i<=28; i++))
do 
wget https://loremflickr.com/320/240/cat -O /home/syamil/Soal3/pdkt_kusuma_$i.jpg -a wget.log
done

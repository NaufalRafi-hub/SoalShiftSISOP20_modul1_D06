# SoalShiftSISOP20_modul1_D06

Soal Shift Modul 1
1. [Soal 1](#1-soal-1)
2. [Soal 2](#2-soal-2)
3. [Soal 3](#3-soal-3)


### 1. Soal 1
##### Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”. Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :
##### a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit
##### b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a
##### c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b
##### Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakan laporan tersebut.
##### *Gunakan Awk dan Command pendukung

Pada folder Soal1 Terdapat sebuah bash script bernama `soal1.sh`. Isi dari bash script tersebut ialah:

```sh
#!/bin/bash

jwbn1a=$(awk -F'\t' '{a[$13] += $NF} END {for (i in a) if(i != "Region") print i,a[i]}' Sample-Superstore.tsv | sort -gk2 | head -1 | awk '{print $1}' )

echo "Jawaban 1 a:"
echo $jwbn1a

jwbn1b=$(awk -F'\t' -v temp="$jwbn1a" '$13 ~ temp {a[$11] += $NF} END {for (i in a) if(i != "Region") print a[i],i}' Sample-Superstore.tsv | sort -gk1 | head -2 | awk '{print $2}' )

echo "Jawaban 1 b:"
echo $jwbn1b


echo "Jawaban 1 c:"
awk -F'\t' -v temp1="$jwbn1a" '$11 ~ /Texas/ || $11 ~ /Illinois/ && $13 ~ temp1 {a[$17] += $NF} END {for (i in a) if(i != "Region") print a[i],i}' Sample-Superstore.tsv | sort -gk1 | head
```
Untuk soal 1 bagian a jawabannya adalah bagian kode berikut:
```sh
jwbn1a=$(awk -F'\t' '{a[$13] += $NF} END {for (i in a) if(i != "Region") print i,a[i]}' Sample-Superstore.tsv | sort -gk2 | head -1 | awk '{print $1}' )

echo "Jawaban 1 a:"
echo $jwbn1a
```

Penjalasan:
+ `awk -F'\t'` Field separatornya menjadi tab.
+ `'{a[$13] += $NF} END {for (i in a) if(i != "Region") print i,a[i]}' Sample-Superstore.tsv | sort -gk2 | head -1 | awk '{print $1}' )` Terdapat array *a* yg indeksnya merupakan data pada kolom ke-13 yaitu kolom *Region*. Selanjutnya menjumlahkan data pada kolom `NF` yg berarti kolom terakhir yaitu kolom *Profit* dan disimpan dalam array *a*. Lalu melakukan *looping* jika dalam kolom ke-13 tidak terdapat data *Region*, karena dimulai dari baris pertama, dengan mengoutputkan hasil penjumlahan untuk setiap region yg ada. Hasil dari output tersebut kemudian di urutkan dengan *command* sort dimana `-g` berarti mengurutkan nilai numerik secara umum dan `-k2` berarti mengurutkan variabel ke-2 dalam hal ini berarti variabel `a[i]`. Setelah di urutkan dilakukan command `head -1` agar hanya menampilkan baris pertama. Lalu dilakukan `awk '{print $1}'` agar hanya menampilkan variabel pertama dari hasil `awk` pertama dalam hal ini variabel *i*.
+ `jwbn1a=$` Output disimpan dalam variabel *jwbn1a*.
+ `echo "Jawaban 1 a:" echo $jwbn1a` Menampilkan variabel *jwbn1a*

Untuk soal 1 bagian b jawabannya adalah bagian kode berikut:
```sh
jwbn1b=$(awk -F'\t' -v temp="$jwbn1a" '$13 ~ temp {a[$11] += $NF} END {for (i in a) if(i != "Region") print a[i],i}' Sample-Superstore.tsv | sort -gk1 | head -2 | awk '{print $2}' )

echo "Jawaban 1 b:"
echo $jwbn1b
```

Penjelasan:
+ Untuk soal b hampir mirip dengan soal a hanya berbeda pada bagian pola yang mengikuti hasil dari soal a.
+ `-v temp="$jwbn1a"` Menyimpan hasil soal a pada variabel *temp*
+ `$13 ~ temp` Mencari data pada kolom ke-13 yang memiliki kesamaan pada variabel *temp* yang berarti hasil dari soal a.
+ `sort -gk1` Mengurutkan hasil pada variabel pertama dalam hal ini variabel *a[i]*.
+ `head -2` Menampilkan data 2 baris teratas.
+ `awk '{print $2}` Menampilkan variabel kedua dari hasil `awk` pertama dalam hal ini variabel *i*
+ `jwbn1b=$` Output disimpan dalam variabel *jwbn1b*.
+ `echo "Jawaban 1 b:" echo $jwbn1b` Menampilkan variabel *jwbn1b*

Untuk soal 1 bagian c jawabannya adalah bagian kode berikut:
```sh
echo "Jawaban 1 c:"
awk -F'\t' -v temp1="$jwbn1a" '$11 ~ /Texas/ || $11 ~ /Illinois/ && $13 ~ temp1 {a[$17] += $NF} END {for (i in a) if(i != "Region") print a[i],i}' Sample-Superstore.tsv | sort -gk1 | head
```

Penjelasan:
+ Untuk soal c hampir mirip dengan soal b hanya berbeda pada bagian pola yang mengikuti hasil dari soal b.
+ `-v temp1="$jwbn1a" '$11 ~ /Texas/ || $11 ~ /Illinois/ && $13 ~ temp1` Mencari data pada kolom ke-11 yang memiliki kata *Texas* atau *Illinois*, dan mencari data pada kolom ke-13 yang memiliki kesamaan pada variabel *temp1* yang berarti hasil dari soal a.
+ `head` Menampilkan data 10 baris teratas.


### 2. Soal 2
pada folder soal 2 terdapat file tugas2.sh, tugas2enc.sh, dan tugas2decr.sh
+ tugas2.sh adalah tugas yang diminta untuk mengoutputkan random karakter dan output tersebut dimasukkan kedalam file berupa .txt
+ tugas2enc.sh adalah tugas yang diminta untuk menenkripsi nama file yang disimpan berdasarkan dari tugas2.sh
+ tugas2decr.sh adalah tugas yang meminta untuk megembalikan hasil enkripsi

PENJELASAN tugas2.sh
```sh
#!/bin/bash 


if [[ $1 =~ ^[a-zA-Z]+$ ]]
```
yang dimaksud dalam kondisi tersebut adalah jika user menginputkan nomor/symbol atau kecuali alphabet di $1(argumen pertama) maka tidak masuk dalam kondisi if
```sh
then
	</dev/urandom tr -dc 'A-Za-z0-9' | head -c 28 > /home/rafi/$1.txt
 ```
 yang dimaksud adalah urandom ini untuk merandom kata dan dalam tr adalah kondisi dimana kata yang dirandom itu antara A sampai Z , a sampai z , dan 0-9, dan disimpan di directory home
```sh 
else 
	echo "tidak boleh angka"
fi
```
masuk kedalam kondisi else jika user menginputkan angka

PENJELASAN tugas2enc.sh

```sh
if [[ $1 =~ ^[a-zA-Z]+$ ]]
```
sama seperti yang dijelaskan diatas
```sh
then

input=$1

jam=`date "+%H"
```
yang dilakukan dalam kondisi ini adalah menyimpan argumen pertama kedalam variable input, dan menyimpan waktu yang sedang berlangsung (hanya jam) kedalam variable jam
```sh
upcase=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")
lowcase=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z")

batas1=${upcase[jam]}
batas2=${upcase[jam-1]}
batas3=${lowcase[jam]}
batas4=${lowcase[jam-1]}

output=$(echo "$1" | tr '[A-Za-z]' ["$batas1"-ZA-"$batas2""$batas3"-za-"$batas4"])

</dev/urandom tr -dc 'A-Za-z0-9' | head -c 28 > /home/rafi/$output.txt
```
membuat array yang bernama upcase, array tersebut diisi A-z (kapital) , membuat variabel bernama batasan1 sampai batasan4 untuk digunakan sebagai batasan di dalam variabel output (didalam tr), variabel batasan1-batasan4 ini digunakan untuk memenuhi kondisi tr dimana cara kerja tr adalah tr [OPTION] SET1 [SET2], dan batas1 ini untuk memulai pergantian huruf berdasarkan jam dan dibataskan dengan batas2 begitu juga batas3 dengan batas4


PENJELASAN tugas2decr.sh 

```sh
#!/bin/bash 
input=$1

jam=`date -r $input "+%H"`

file="${input%.txt}"
#echo $jam
```
$1 untuk mengetahui inputan yang ingin di decrypt, variabel jam untuk mengetahui kpaan file terakhir di modifikasi dan diambil variabel jamnya, variabel file agar file yang diinputkan berbentuk output.txt

```sh
#biar muter
batas1=${upcase[26-jam]}
batas2=${upcase[26-jam-1]}
batas3=${lowcase[26-jam]}
batas4=${lowcase[26-jam-1]}
```
26 menjadi pengurang karena dari a sampai z mempunyai huruf sebanyak 26, agar dari yang sudah di enkripsi menjadi normal kembali
```sh
mv $input $output.txt
```
#untuk mengubah file yang awalnya diinputkan menjadi outputnya

### 3. Soal 3

Untuk Soal 3 dari kesulitan karena tenaga dan pikiran dari kami terbatas dan juga waktu yg tidak begitu mendukung

# SoalShiftSISOP20_modul1_D06

Soal Shift Modul 1
1. [Soal 1](#1-soal-1)


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

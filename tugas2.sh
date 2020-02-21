
#!/bin/bash 

chr() {
  [ "$1" -lt 256 ] || return 1
  printf "\\$(printf '%03o' "$1")"
}

if [[ $1 =~ ^[a-zA-Z]+$ ]]
then
	</dev/urandom tr -dc 'A-Za-z0-9' | head -c 28 > /home/rafi/log/$1.txt
else 
	echo "tidak boleh angka"
fi

jam=`date "+%H"`

x= `chr "$jam"`


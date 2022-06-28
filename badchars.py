#!/usr/bin/python
#Autor - Izael Magalhaes
#Scrip para gerar lista de badchars
#Gerando a lista
print(' '.join(hex(num).replace('0x','\\x') for num in range(1,256)))

![[eebabde7-527a-45b9-8a89-5f043afe79d7.jpg]]

## 1
![[Pasted image 20261002194917.png]]

## 2
2
## 3 
Pagina = 2048 bytes
Dir logicas a fisicas 
Pagina = dirLogica / tamanio pagina
Desplazamiento = dirLogica mod tam
7250:
Pagina = 7250 / 2048 = 3
Desplazamiento = 7250 mod 2048 = 1106
Direccion fisica = (13x2048)+1106 = 27730
1919:
Pagina = 1919/ 2048 = 0
Desplazamiento= 1919 mod 2048 = 1919
Dir fisica = (3x2048)+1919 = 8063
5000:
Pagina = 5000/2048 = 2 
Despla = 5000 mod 2048 = 904
Dir fisica = (10x2048) = 21384
## 4 
a) 2^18 = 262144 paginas
b) 2^14 = 16384 bytes
c) 2^18 x 2^1 = 2^19
d) 13798 / 16384 = 1 pagina y sobra espacio (frag interna)
e) 84542 / 16384 = 5, algo ~ 6 paginas. 6x16384 = 98304-84542 = 13762 bytes de fragmentacion. 
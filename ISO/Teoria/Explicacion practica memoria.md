- Page fault: hard page fault es un fallo de pagina y se produce cada vez que hay que alocar una pagina en un marco.
- Cuando se aloca una pagina y no hay espacio se selecciona pagina victima con un algorito. El mejor algoritmo es el que selecciona una pagina que no va a ser referenciada en un futuro.
## Algoritmos: 
- Optimo: Selecciona la pagina cuya proxima referencia se encuentra mas lejana a la actual. Es imposible de implementar ya que no se conoce futuros eventos
  Ej : ![[Pasted image 20261114161541.png]]
- LRU: reemplaza la pag q no fue referenciada x mas tiempo, cada pag tiene info de su ultima ref. 
  Ej: ![[Pasted image 20261114162005.png]]
- FIFO: La pag mas vieja se remplaza, sin importar si se va a usar.
  ![[Pasted image 20261114162202.png]]
- FIFO 2da chance: se usa un bit de referencia. Cuando se carga la pag en mem el bit R=0, cuando es referenciada R=1. Se selecciona la primer pag q bit R=0, mientras se busca cada uno q tiene R=1 se cambia a 0. Se arranca a buscar desde donde quedo el puntero.
  ![[Pasted image 20261114163136.png]]
## Asignacion de marco:
- Asignacion fija: cada proceso se asigna cant fija de marcos.
- Asignacion dinamica: cada proceso se asigna 
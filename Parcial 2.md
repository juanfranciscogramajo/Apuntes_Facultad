
![[553a8e98-f309-4843-acc5-e71ea760c82d.jpg]]
## 1
![[Pasted image 20261002175923.png]]
## Ejercicio 2: Planificación de Procesos (Colas Multinivel)

**a) ¿A qué tipo de procesos beneficia el Algoritmo?** Beneficia a los procesos ligados a Entrada/Salida (**I/O Bound**). Como estos procesos se bloquean antes de agotar su _quantum_, el algoritmo los premia reincorporándolos siempre a la cola de máxima prioridad (Q0), asegurando una respuesta rápida.

**b) ¿Puede ocurrir inanición? Justifique su respuesta.** Sí, puede ocurrir **inanición** para los procesos ligados a CPU. Si existe un flujo constante de procesos nuevos o procesos cortos que ingresan y se mantienen en Q0, la cola Q1 (donde caen los procesos pesados) podría no ser atendida nunca.

**c) Proponga una mejora para el algoritmo de modo tal que el mismo sea más performante.** Implementar un mecanismo de **envejecimiento (aging)**, donde los procesos que lleven mucho tiempo esperando en Q1 sean promovidos a Q0 para garantizar que reciban tiempo de CPU. Alternativamente, se podría aumentar el tamaño del _quantum_ en Q1 para reducir el _overhead_ de los cambios de contexto en los procesos pesados.
## 3
Pagina = 2 KIB = 2048 bytes
13850:
Marco = 13850/2048 = 6
Desplazamiento = 13850 mod 2048 = 1562
Direccion logica = 1562 (Pagina x Tam pagina)+ desplaza.
9554:
Marco = 9554 / 2048 = 4
Desplazamiento = 9554 mod 2048=1362
Dir logica = (2x2048)+1362 = 5458
9303:
Marco = 9303/2048 = 4
Desplaza = 9303 mod 2048 = 1111
Dir log = (2x2048)+1111 = 5207 
12346:
Marco = 12346/ 2048 = 6 
Desplaza 12346 / 2048= 58
Dir log = 58
0:
Marco = 0,
Desplaza = 0
Dir log = (4x2048) =8192
5000:
Marco 
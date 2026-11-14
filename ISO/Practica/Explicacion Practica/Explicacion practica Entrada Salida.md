## Organización Física y Capacidad de un HDD**
- **Estructura:** Un disco rígido se compone de platos (_platters_) con dos superficies (caras), cada una con su propia cabeza de lectura/escritura. Cada cara se divide en pistas concéntricas (_tracks_), y las pistas se dividen en sectores.
- **Cilindro $N$:** Es el conjunto formado por todas las pistas número $N$ de todas las caras del disco.
- **Capacidad total:** Se calcula multiplicando:
-  Capacidad = Caras x Pistas por cara x Sectores por pista x Tamaño del sector.
- **Prefijos binarios:** En la práctica se utilizan potencias de 2: $\text{KiB}$ ($2^{10}$), $\text{MiB}$ ($2^{20}$), $\text{GiB}$ ($2^{30}$) y $\text{TiB}$ ($2^{40}$).
**Acceso y Tiempos de un HDD**
- **Traducción:** Una llamada al sistema (_System Call_) pasa el requerimiento al subsistema de E/S, que lo traduce a coordenadas físicas: `(#Cara, #Cilindro, #Sector)`.
- **Componentes del tiempo de acceso:**
    - _Seek time:_ Tiempo que tarda el brazo en mover la cabeza hasta el cilindro buscado (es el parámetro que más influye en el rendimiento).
    - _Latency time (latencia rotacional):_ Tiempo que tarda el sector deseado en girar hasta quedar debajo de la cabeza. Si no se conoce, se estima como el tiempo de **media vuelta** del disco.
    - _Transfer time:_ Tiempo que lleva leer/escribir los datos del bloque hacia o desde la memoria.
- **Fórmulas según tipo de almacenamiento:**
    - **Secuencial:** $\text{Seek} + \text{Latency} + (\text{Transfer\_bloque} \times \text{\#Bloques})$
    - **Aleatorio:** $(\text{Seek} + \text{Latency} + \text{Transfer\_bloque}) \times \text{\#Bloques}$
**Algoritmos de Planificación de Disco** Su objetivo es minimizar los movimientos del brazo (el _seek time_) ordenando los pedidos pendientes según el número de cilindro:
- **FCFS (_First Come First Served_):** Atiende los pedidos en estricto orden de llegada. Si una pista se pide varias veces en distintos momentos, la visita cada vez por separado.
  ![[Pasted image 20261114173009.png]]
- **SSTF (_Shortest Seek Time First_):** Elige siempre el requerimiento pendiente que esté más cerca de la posición actual del cabezal.
  ![[Pasted image 20261114173029.png]]
- **SCAN:** Barre el disco en una dirección atendiendo todo a su paso hasta llegar **al extremo físico del disco** (pista 0 o la última), donde invierte el sentido.
  ![[Pasted image 20261114173047.png]]
- **LOOK:** Igual que SCAN, pero en vez de llegar hasta el borde físico del disco, invierte el sentido apenas atiende **el último requerimiento pendiente** en esa dirección.
  ![[Pasted image 20261114173113.png]]
- **C-SCAN (_Circular SCAN_):** Barre en un solo sentido hasta el extremo físico del disco, salta al extremo opuesto (**este salto no se cuenta como movimiento**) y vuelve a barrer en el mismo sentido.
  ![[Pasted image 20261114173132.png]]
- **C-LOOK (_Circular LOOK_):** Igual que C-SCAN, pero solo llega hasta el último requerimiento pendiente en el sentido actual y salta directamente al primer requerimiento del otro extremo (sin contar el salto).
  ![[Pasted image 20261114173155.png]]
(Nota importante para los ejercicios: en SCAN, LOOK, C-SCAN y C-LOOK es fundamental saber de qué pista viene el cabezal para determinar su sentido inicial. Además, a diferencia de FCFS, todos estos algoritmos atienden los pedidos repetidos a una misma pista de forma consecutiva en una sola pasada).

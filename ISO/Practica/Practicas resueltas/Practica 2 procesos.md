1. Para los siguientes algoritmos de scheduling: 
   
   ➢**FCFS (First Come First Served):** Atiende los procesos en orden de llegada. Facil, pero si llega primero uno muy largo atrasa a los demas. No cuenta con parametros. Ventaja facil y predecible de implementar pero si llega primero uno largo retrasa los demas. Algoritmo orientado a procesos por lotes (Batch).
   
   ➢ **SJF (Shortest Job First):** politica non preemptive que selecciona el proceso con la rafaga mas corta. Los procesos cortos delante de los largos, los largos pueden starvation. Requiere un parametro de prediccion de tiempo que durara la prox rafaga. Minimiza tiempo de espera, es dificil predecir. Algoritmo orientado a procesos por lotes (Batch).
   
   ➢ **Round Robin:** algoritmo apropiativo que asigna a cada proceso un tiempo para usar cpu. Su parámetro  es el **Quantum**. Mejor distribucion de tiempos, pero si el tiempo para cada proceso (Quantum) es corto, el sistema debe cambiar constantemente. Usado en procesos interactivos y sistema de tiempo compartido. **EL MAS USADO**
   
   ➢ **Prioridades:** cada proceso tiene un valor que representa su prioridad, menor valor = mayor prioridad. Existe ready queue cada nivel de prioridad, procesos en baja prioridad puede starvation. Solucion Agin puede ser preemptive o no. Usado para procesos interactivos.
   
   a. Explique su funcionamiento mediante un ejemplo. 
   b. ¿Alguno de ellos cuentan con parámetros para su funcionamiento? Identifique y enunciarlos. 
   c. Cual es el más adecuado según los tipos de procesos y/o SO. 
   d. Cite ventajas y desventajas de su uso. 
   e. Defina Tiempo de retorno (TR) y Tiempo de espera (TE) para un proceso. 
   -**Tiempo de Retorno (TR):** Es el tiempo transcurrido entre el comienzo de un proceso y su finalización.
   - **Tiempo de Espera (TE):** Es el tiempo total que un proceso pasa en la cola de procesos listos sin ejecutar instrucciones.+
   f. Defina Tiempo Promedio de Retorno (TPR) y Tiempo promedio de espera (TPE) para un lote de procesos.
- **Tiempo Promedio de Retorno (TPR):** Es la sumatoria de todos los TR de un lote, dividida por la cantidad total de procesos. 
- **Tiempo Promedio de Espera (TPE):** Es la sumatoria de todos los TE, dividida por la cantidad total de procesos.
   g. Defina tiempo de respuesta
   - **Retorno (TR ):** tiempo que transcurre entre que el proceso llega al sistema hasta que completa su ejecución.
1. Inanición (Starvation) 
   a. ¿Qué significa? 
		Cuando un proceso espera indefinidamente por cpu ya que el planificador elige procesos antes q el.
   b. ¿Cuál/es de los algoritmos vistos puede provocarla? 
	   SJF, Prioridades, Colas multinivel, SRTF.
   c. ¿Existe alguna técnica que evite la inanición para el/los algoritmos mencionados en el inciso b?
	   Agin es una tecnica que consiste en aumentar la prioridad a medida que pasa el tiempo de espera, En prioridades es directamente asi, en sjf/srtf reduce tiempo de cpu artificialmente.
10- si el proceso es "I/O-bound" y abandona constantemente la CPU para irse a dormir mucho antes de que pasen los "ticks" necesarios, su contador nunca llegará a cero. Esto significa que nunca sufrirá el caso especial de la transición _Running-Ready_, la cual ocurre exclusivamente cuando un proceso termina su quantum de tiempo (llega a cero) sin haber solicitado I/O y es expulsado de la CPU contra su voluntad.
11-
Formula 1= Sn+1 = (1/n)Tn + (n-1/n)Sn      
6, 4, 6, 4, 13, 13, 13                                       
n=1 t=6                                                        
S(1)+1 = (1/(1))6 + (1-1/1)10                       
s2= 6 + 0 = 6                                               
n=2 T =4                                                      
S(2)+1 = (1/(2))4 + ((2)-1/2)6                       
S3 = 2+ 3 = 5
n=3 t=6
S(3)+1 = (1/(3))6 + ((3)-1/3)5
S4 = (1/(3))6 + ((3)-1/2)5
S4 = 2 + 3,33 = 5,33
n=4 t=4
S(4)+1 = (1/(4))4 + ((4)-1/4)5,33
S5 = 1 + 4 = 5
n=5 t=13
S(5)+1 = (1/(5))13 + ((5)-1/5)5
S6 = 2,6 + 4 = 6,6
n=6 t=13
S(6)+1 = (1/(6))13 + ((6)-1/6)6,6
S7 = 2,16 + 5,5 = 7,66
n=7 t = 13
S(7)+1 = (1/(7))13 + ((7)-1/7)7,66
S8= 1,85 + 6,56 = 8,42

Formula 2 Sn+1 = aTn + (1-a)Sn
a = 0,2| 0,5 | 0,8
S1= 10
S(1)+1= 0,2(6) + (1-0,2)10
S2= 1,2 + 8 = 9,2
S2 = 0,5(6) + (1-0,5)10
S2 = 3 + 5 = 8
S2 = 0,8(6) + (1-0,8)10
S2 = 4,8 + 2 = 6,8

S(2)+1= 0,2(4) + (1-0,2)9,2
S3 = 0,8 + 7,36 = 8,16
S(2)+1= 0,5(4) + (1-0,5)8
S3 = 2 + 4 = 6
S(2)+1= 0,8(4) + (1-0,8)6,8
S3 = 3,2 + 1,36 = 4,56


S(3)+1= 0,2(6) + (1-0,2)8,16
S4 = 1,2 + 6,528 = 7,73
S(3)+1= 0,5(6) + (1-0,5)6
S4 = 3 + 3 = 6 
S(3)+1= 0,8(6) + (1-0,8)4,56
S4 = 4,8 + 0,912 = 5,71

S(4)+1= 0,2(4) + (1-0,2)7,72
S5 = 0,8 + 6,184 =6,98
S(4)+1= 0,5(4) + (1-0,5)6
S5 = 2 + 3 = 5 
S(4)+1= 0,8(4) + (1-0,8)5,71
S5 = 3,2 +1,142 = 4,342

12 Colas Multinivel Actualmente los algoritmos de planificación vistos se han ido combinando para formar algoritmos más eficientes. Así surge el algoritmo de Colas Multinivel, donde la cola de procesos listos es dividida en varias colas, teniendo cada una su propio algoritmo de planificación. a. Suponga que se tiene dos tipos de procesos: Interactivos y Batch. Cada uno de estos procesos se coloca en una cola según su tipo. ¿Qué algoritmo de los vistos utilizará para administrar cada una de estas colas?. 
Para **Interactivos:** RR, Prioridades, Colas multinivel, SRTF, 
para **Batch**: SJF, FCFS
b. Para el caso de las dos colas vistas en a: ¿Qué algoritmo utilizaría para planificarlas?
el método adecuado es una **Planificación por Prioridades Estrictas (Expulsiva)**, apoyándose en los servicios de manejo de prioridades del sistema operativo.

---
18-  
a = hola, 
b = hola
c = anda a ...., como te fue...
19)
a= 2^3 
b= si

---
20)
a=  se imprime 8 veces 1
b= todas las lineas tienen mismo valor, excepto el pID que tendra 

---
21)
Dado un esquema de segmentación donde cada dirección hace referencia a 1 byte y la siguiente tabla de segmentos de un proceso, traduzca, de corresponder, las direcciones lógicas indicadas a direcciones físicas. La Dirección lógica está representada por: segmento:desplazamiento 
Segmento Dir. Base Tamaño 
0 102 12500 
1 28699 24300 
2 68010 15855 
3 80001 400 

i. 0000:9001, segmento 0, 102 dir base + 9001 = 9103 dir fisica

ii. 0001:24301, segmento 1, 28699 + 24301 XXX invalido ya que supera el desplazamiento al tamaño del segmento

iii. 0002:5678, segmento 2, 68010 dir base, tamaño 15855, 5678 el desplazamiento OK,            68010 + 5678 = 73688 dir fisica 

iv. 0001:18976. segmento 1, que tiene dir base 28699, tamaño 24300, desplazamiento 18976 OK
28699 + 18976 = 47675 dir fisica

v. 0003:0 segmento 3, dir base 80001, tamaño 400, desplazamiento 0, 80001 dir fisica.

---
22)Segmentacion paginas, marcos etc
LOGICAS A FISICAS
1. **Número de página (p):** Dirección Lógica $\div$ Tamaño de Página. (Tomas solo la parte entera).
    
2. **Desplazamiento (d):** Dirección Lógica $MOD$ Tamaño de Página. (Es el resto de la división).
    
3. **Dirección Física:** Una vez que tienes `p`, buscas en la tabla en qué `Marco` está. Luego multiplicas: $(Marco \times Tamaño \ de \ Página) + d$.
4. **Límite de seguridad:** Recuerda que el proceso mide **2000 bytes**. Cualquier dirección lógica que sea 2000 o mayor no pertenece al proceso (Error).

b. Indicar si las siguientes direcciones lógicas corresponden al espacio lógico del proceso P1 y en caso afirmativo indicar la dirección física a la que corresponden: 

i. 35, como 35 < 2000 vale para num pagina 35/512 = 0, pagina 0, desplazamiento 35/512 = 35,     direccion fisica = (3x512) + 35 = 1571.

ii. 512 pagina 1, desplazamiento 0, dir fisica 5x512 = 2560

iii. 2051 INVALIDO SUPERA EL TAMANIO DEL PROCESO no corresponde al espacio logico del proce

iv. 0 pagina 0, desplazamiento 0, direccion fisica= 1536

v. 1325 valid, 1325/512 = 2 pagina, desplazamiento 301, (2x512)+301 = 1325 dir fisica

vi. 602 valid, 602/512 = 1 pagina, desplazamiento 45, dir fiscia = (5x512) + 90 = 2650

---
FISICAS A LOGICAS
- **Marco (m):** Dirección Física $\div$ Tamaño de Página.
    
- **Desplazamiento (d):** Dirección Física $MOD$ Tamaño de Página.
    
- **Dirección Lógica:** Buscas el `m` en la tabla para ver a qué `Página` corresponde. Luego calculas: $(Página \times Tamaño \ de \ Página) + d$.
    
    - _Nota:_ Si el Marco no está en la tabla de P1, esa memoria no es de este proceso.
c. Indicar, en caso de ser posible, las direcciones lógicas del proceso P1 que se corresponden a las siguientes direcciones físicas: 
i. 509 para saber marco 509/512 =  0, en la tabla no existe x lo tando no corresponde a una direccion logica del proceso 
ii. 1500 1500/512 = marco 2, desplazamiento 1500mod512= desplazamiento 476, Dir log = (2 (porque corresponde al marco 2) x 512) + 476 = dir logica 1500 
iii. 0  marco 0 no corresponde a ninguna pagina del proceso
iv. 3215 3215/512 = marco 6, 3215mod512 = desplaza 143, dir log =(3x512)+143 =1679 es menor a 2000 corresponde
v. 1024 marco 2, desplaza 0. dir log = 2x512 = 1024
vi. 2000 2000/512 = marco 3, desplaza 2000 mod 512 = 464, dir Log (0x512)+464 = 464

23)
Dado un esquema donde cada dirección hace referencia a 1 byte, con páginas de 2 KiB (KibiBytes), donde el frame 0 se encuentra en la dirección física 0. Con las siguientes siguientes primeras entradas de la tabla de páginas de un proceso, 

Página Marco 
0 16 
1 13 
2 9 
3 2 
4 0 
traduzca las direcciones lógicas indicadas a direcciones físicas:
i. 5120 5120 / 2048 = pagina 2, desplazamiento 5120 mod 2048 = 1024. dir fis = (9x2048)+1024 = 19456 
ii. 3242 3242  
iii. 1578 
iv. 2048 
v. 8191
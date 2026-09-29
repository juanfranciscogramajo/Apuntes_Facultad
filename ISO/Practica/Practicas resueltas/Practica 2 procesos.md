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
Formula 1= Sn+1 = (1/n)Tn + (n-1/n)Sn      | Formula 2 Sn+1 = aTn + (1-a)Sn
6, 4, 6, 4, 13, 13, 13                                       | a = 0,2| 0,5 | 0,8
n=1 t=6                                                        | n=1 t=6
S(1)+1 = (1/(1))6 + (1-1/1)10                       |
s2= 6 + 0 = 6                                               |
n=2 T =4                                                      |
S(2)+1 = (1/(2))4 + ((2)-1/2)6                      |
S3 = 2+ 3 = 5                                               |
n=3 t=6                                                       |
S(3)+1 = (1/(3))6 + ((3)-1/3)5                      |
S4 = (1/(3))6 + ((3)-1/2)5                             |
S4 = 2 + 3,33 = 5,33                                    |
n=4 t=4                                                       |
S(4)+1 = (1/(4))4 + ((4)-1/4)5,33                 |
S5 = 1 + 4 = 5                                             |
n=5 t=13                                                     | 
S(5)+1 = (1/(5))13 + ((5)-1/5)5                    |
S6 = 2,6 + 4 = 6,6                                       |
n=6 t=13                                                     |
S(6)+1 = (1/(6))13 + ((6)-1/6)6,6                 |
S7 = 2,16 + 5,5 = 7,66                                 |
n=7 t = 13                                                   |
S(7)+1 = (1/(7))13 + ((7)-1/7)7,66               |
S8= 1,85 + 6,56 = 8,42                               |
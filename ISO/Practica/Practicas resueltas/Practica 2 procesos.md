1. Para los siguientes algoritmos de scheduling: 
   
   ➢**FCFS (First Come First Served):** Atiende los procesos en orden de llegada. Facil, pero si llega primero uno muy largo atrasa a los demas. No cuenta con parametros. Ventaja facil y predecible de implementar pero si llega primero uno largo retrasa los demas. Algoritmo orientado a procesos por lotes (Batch).
   
   ➢ **SJF (Shortest Job First):** politica non preemptive que selecciona el proceso con la rafaga mas corta. Los procesos cortos delante de los largos, los largos pueden starvation. Requiere un parametro de prediccion de tiempo que durara la prox rafaga. Minimiza tiempo de espera, es dificil predecir. Algoritmo orientado a procesos por lotes (Batch).
   
   ➢ **Round Robin:** algoritmo apropiativo que asigna a cada proceso un tiempo para usar cpu. Su parámetro  es el **Quantum**. Mejor distribucion de tiempos, pero si el tiempo para cada proceso (Quantum) es corto, el sistema debe cambiar constantemente. Usado en procesos interactivos y sistema de tiempo compartido.
   
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
<font color="#ff0000">tiempo cpu:</font> tiempo que usa la cpu un proceso
<font color="#ff0000">t retorno:</font> tiempo que pasa entre que el proceso llega al sist hasta que completa su ejecucion, tambien como latencia. Es importante en procesos grandes.
<font color="#ff0000">t Espera:</font> t que el proceso pasa sin ejecutarse (t retorno - t cpu), 
<font color="#ff0000">promedios: </font>tiempos promedios de retorno y tiempos promedios de espera, 
<font color="#92d050">ver</font> parte algoritmo FIFO para parcial, qplanif.
celeste tiempo de uso cpu, otros I/O.
<font color="#ff0000">|</font> para unir procesos.
<font color="#ff0000"> cpu bound:</font> rafagas largas de cpu, no I/O(creo)
<font color="#ff0000"> I/O bound:</font> rafagas de cpu cortas y I/O.
<font color="#ff0000">Aging: </font>tecnica que cuando un proceso del cpu no se toma y esta en espera a medida que pasan ciclos se sube la prioridad.
<font color="#ff0000">Empate:</font> 3 procesos a la vez, esta en cola de listos, misma prioridad y empatan en todos, no se sabe cual se encola primero, se resuelve con una convencion de la catedra:
el mas viejo primero (FIFO) y si persiste el que tiene PID mas chico.
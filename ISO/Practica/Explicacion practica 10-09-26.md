<font color="#ff0000">tiempo cpu:</font> tiempo que usa la cpu un proceso
t retorno: tiempo que pasa entre que el proceso llega al sist hasta que completa su ejecucion, tambien como latencia. Es importante en procesos grandes.
t Espera: t que el proceso pasa sin ejecutarse (t retorno - t cpu), 
promedios: tiempos promedios de retorno y tiempos promedios de espera, 
ver parte algoritmo FIFO para parcial, qplanif.
celeste tiempo de uso cpu, otros I/O.
| para unir procesos.
 cpu bound rafagas largas de cpu, no I/O(creo)
 I/O bound rafagas de cpu cortas y I/O.
Aging: tecnica que cuando un proceso del cpu no se toma y esta en espera a medida que pasan ciclos se sube la prioridad.
3 procesos a la vez, esta en cola de listos, misma prioridad y empatan en todos, no se sabe cual se encola primero, se resuelve con una convencion de la catedra:
el mas viejo primero (FIFO) y si persiste el que tiene PID mas chico.
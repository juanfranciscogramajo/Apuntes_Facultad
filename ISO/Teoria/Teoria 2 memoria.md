## Memoria virtual
dispositivo de mem secundaria, que apoya a la ppal. Almacena secciones del proceso. El so debe manear el movimiento de paginas entre las mem.
**Conjunto Residente(Working Set):** porcion de espacio de direcciones del proceso en memoria.
**Memoria Virtual con Paginacion:** cada proceso tiene tabla de paginas, cad entrada a la tabla hace referencia al frame de la pag en mem ppal y bits de control.
- Bit V: Indica si la pagina esta en memoria, lo activa SO, consulta HW.
- Bit M: Indica si la pag fue mod, si se mod se debe mod mem sec. lo activa HW, consulta y desac SO.
## Fallo de paginas
Cuando el proceso intenta usar una direccion que esta en una pagina pero no esta en mem ppal. Bit V= 0. 
**Manejo del fallo:** El HW detecta y genera Trap al SO, SO pone en espera al proceso, busca un frame libre en mem secund, trae la pagina desde el disco, actualiza la tabla de páginas(bit V = 1 y dir base del frame) y pone al proceso nuevamente como "Ready".
**Pagina Victima:** si hay un fallo y no quedan marcos libres en mem, se selecciona una pag victima para sacarla y hacer espacio.
Algoritmos de reemplazo: 
- FIFO: simple de implementar, la mas antigua es remplazada.
- Optimo: reemplaza la que no se usara por mas tiempo.
- LRU: favorece a las paginas usadas recientemente.
  NRU: se basa en bits de uso y modificacion.
**Effective Acces Time(EAT):** EAT = (1 – p) x memory access + 
p x (page_fault_overhead + [swap_page_out] + swap_page_in + restart_overhead).
## Formas de organizar tablas
**Tabla de 1 nivel:**
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
**Algoritmos de reemplazo:** 
- FIFO: simple de implementar, la mas antigua es remplazada.
- Optimo: reemplaza la que no se usara por mas tiempo.
- 2da chance: fifo que beneficia a las paginas mas referenciadas
- LRU: favorece a las paginas accedidas recientemente.
  NRU: se basa en bits de uso y modificacion, favorece a las paginas que fueron usadas recientemente.
**Alcance del remplazo:**
- **Global**: le puede sacar marcos a cualquier otro proceso.
- **Local**: solo reemplaza páginas del mismo proceso que causó el fallo, no cambia cantidad de frames asignados, el SO det la tasa de 
**Effective Acces Time(EAT):** EAT = (1 – p) x memory access + 
p x (page_fault_overhead + [swap_page_out] + swap_page_in + restart_overhead).
## Formas de organizar tablas
**1. Tabla de 1 nivel (Única lineal)** Es el enfoque más básico, donde existe una sola tabla continua y cada entrada corresponde a una página virtual.

- **Ventajas:** Permite una traducción directa con un solo acceso a la tabla y utiliza un hardware (MMU) muy simple. Además, compartir páginas es trivial porque dos entradas pueden apuntar al mismo marco físico.
  
- **Desventajas:** Su principal problema es que el tamaño de la tabla es proporcional a todo el espacio virtual del proceso, no a la memoria que realmente usa. 

**2. Tabla Multinivel (2 o más niveles)** El propósito de este esquema es dividir " la tabla de páginas lineal en múltiples subtablas más pequeñas. El número de página de la dirección virtual se divide en varios índices (por ejemplo, Nivel 1, Nivel 2, etc.) que van apuntando a la siguiente subtabla.

- **Ventajas:** Solo se crean y cargan en memoria las subtablas que apuntan a regiones de memoria que realmente están en uso. Esto significa que los huecos del espacio virtual no consumen memoria RAM. 
  
- **Desventajas (y error común):** este método ahorra espacio de RAM, pero agrega el costo de hacer un acceso a memoria por cada nivel extra que se deba consultar.
  
**3. Tabla Invertida (Hashing)** Se utiliza en arquitecturas donde el espacio de direcciones es inmenso (como 64 bits), donde las tablas multinivel ocuparían demasiados niveles y la traducción sería muy costosa. Hay **una única tabla global para todo el sistema** que contiene **una entrada por cada marco de la memoria física (RAM)**.

- **Estructura y funcionamiento:** Cada entrada de la tabla registra qué proceso (PID) y qué página virtual ocupan ese marco físico. Como no se puede buscar indexando directamente el número de página virtual, este se transforma mediante una función Hash. Ese Hash indica dónde buscar y, en caso de colisión, se utiliza un mecanismo de encadenamiento.
  
- **Ventajas:** El tamaño de la tabla es fijo y proporcional a la cantidad de memoria RAM instalada, lo que la hace independiente del enorme espacio virtual y totalmente apta para 64 bits.
  
- **Desventajas:** Requiere hacer una búsqueda (hash y cadena) en cada traducción, por lo que depende fuertemente de la caché TLB para no ser lenta. Además, compartir páginas es complejo (porque un marco solo puede registrar a un único proceso/PID) y el Sistema Operativo necesita gestionar una estructura paralela para recordar dónde están las páginas que no se encuentran en la RAM.
- Translation Lookaside Buffer(TLB): contiene las entradas de tabla de paginas que fueron usadas recientemente. 
## Politivas del manejo de Memoria Virtual
F
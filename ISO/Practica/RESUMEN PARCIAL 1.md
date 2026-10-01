# Clase 1
- **SO:** Gestiona HW, controla procesos etc, intermediario usuario y HW, comodiada eficiencia evolucion 
- **Desde la perspectiva del usuario:** El SO funciona como una capa de abstracción sobre la arquitectura, presentando un entorno más simple de manejar. Desde este enfoque, las aplicaciones son los "clientes" 
    
- **Desde la perspectiva del sistema (Administración de recursos):** El SO es un administrador implacable que maneja los recursos de hardware para uno o más procesos. Maneja dispositivos de entrada/salida y memoria secundaria, y permite la ejecución simultánea de procesos mediante la **multiplexación**, tanto en tiempo (turnando el uso de la CPU) como en espacio (dividiendo la memoria).
## Componentes
 - Kernel
   a. Funciones principales:
   - Administración y asignación de la **memoria RAM**. 
   - Planificación y sincronización de **procesos en la CPU**. 
   - Gestión de **controladores de dispositivos (drivers)** e **interrupciones de hardware**. 
   - Control del acceso al **sistema de archivos y redes**. 
   - Las distintas imágenes binarias del kernel coexisten dentro del directorio `/boot` (bajo nombres como `vmlinuz-<versión>`). Al iniciar la computadora, el gestor de arranque (como **GRUB**) permite al usuario seleccionar qué versión del kernel ejecutar. 
- Shell:
  - Programa en **espacio de usuario** que lee texto de entrada (órdenes), lo interpreta y solicita su ejecución al kernel a través de **llamadas al sistema**, devolviendo los resultados en pantalla.  Intérpretes de comandos comunes:
  - **sh (Bourne Shell):** El estándar histórico de UNIX; sintaxis simple, altamente portable pero con funciones interactivas limitadas.
  - **bash (Bourne Again Shell):** Shell por defecto en la mayoría de distros GNU/Linux; incluye historial persistente, autocompletado avanzado y gestión robusta de redirecciones.
  - **zsh (Z Shell):** Shell moderno con autocompletado contextual avanzado, corrección ortográfica de comandos y alta capacidad de personalización mediante temas y plugins. 
  - Ubicación de comandos (Path):
  - **Internos (built-in):** Integrados en el propio binario del Shell en memoria (ej. `cd`, `pwd`, `exit`). 
  - **Externos:** Binarios ejecutables ubicados en rutas del disco especificadas dentro de la variable de entorno `$PATH`, tales como `/bin`, `/sbin`, `/usr/bin` o `/usr/local/bin`. 
  - el Shell se ejecuta en espacio de usuario, un fallo o bloqueo del intérprete no compromete la integridad del núcleo. Además, permite que cada usuario elija o reemplace su interfaz sin modificar el núcleo del SO. 
- Herramientas: editores, compi, libr.
## Servicios Provistos por el SO

El documento detalla que el Sistema Operativo se encarga de ofrecer una amplia gama de servicios esenciales:

- **Procesador:** Se encarga de la planificación, de manejar prioridades, de multiplexar la carga de trabajo y de asegurar la "justicia" (fairness) entre procesos para que no ocurran bloqueos totales.
    
- **Memoria:** Administra las jerarquías de memoria, maneja la relación entre memoria física y virtual, y asegura la protección para que los programas que se ejecutan concurrentemente no interfieran entre sí.
    
- **Almacenamiento y Dispositivos:** Oculta las dependencias del hardware subyacente, administra accesos simultáneos y gestiona el sistema de archivos (directorios, accesos a medios externos).
    
- **Control de Errores y Seguridad:** Detecta y responde a anomalías tanto internas como externas (errores de hardware, fallos de memoria, cálculos aritméticos erróneos, accesos no permitidos, e incapacidad para cumplir peticiones de las aplicaciones).
    
- **Contabilidad:** Recoge estadísticas de uso, monitorea el rendimiento, anticipa futuras necesidades de actualización del equipo e interactúa con el usuario mediante el Shell.
# Clase 2
### Modos de ejecucion
- bit de cpu indica modo actual
- Instrucciones privilegiadas se hacen modo supervisor o kernel
- Modo usuario solo su espacio de direcciones propias
- El sist arranca en modo supervisor, cuando ejecuta un proceso modo usuario. Si int vuelve.
### Protección de la CPU (Interrupción de Clock): 
Para evitar que un proceso acapare la CPU, se implementa un reloj de hardware con un contador. El kernel le asigna un valor que se decrementa con cada "tick". Al llegar a cero, el hardware interrumpe al proceso y le devuelve el control al SO para que pueda ejecutar otro programa.
    
### Protección de la Memoria: 
El hardware permite definir los límites del espacio de direcciones de un proceso (usualmente mediante un registro base y un registro límite). El kernel carga estos registros mediante instrucciones privilegiadas y el hardware verifica (en cada acceso) que las direcciones lógicas se encuentren dentro de los límites permitidos, generando un error si el programa intenta excederlos.
    
### Protección de E/S: 
Las instrucciones de E/S están catalogadas como privilegiadas y solo pueden ejecutarse en Modo Kernel.

### System Calls : 
**Definición:** Son la interfaz y el mecanismo por el cual los programas en Modo Usuario acceden a los servicios del SO.
**Ejecución:** Los parámetros de la llamada se pasan mediante registros, bloques de memoria o la pila (stack). Al invocar la llamada (ej. `read()`), se genera un _trap_ hacia el kernel. El sistema pasa a Modo Supervisor, invoca al manejador de la System Call (_Sys call handler_), ejecuta la función privilegiada y luego retorna el control al programa de usuario.
**Categorías:** Se dividen en llamadas de control de procesos, manejo de archivos, manejo de dispositivos, mantenimiento de información y comunicaciones.
	**Control de Procesos**
	Se encargan de administrar el ciclo de vida, la ejecución y las prioridades de los procesos y sus hilos.
    
    - fork(): Crea un nuevo proceso hijo que es una copia idéntica del proceso padre.
        
    - execve(): Reemplaza la imagen central del proceso por un nuevo programa ejecutable.
        
    - waitpid(): Pausa la ejecución del programa a la espera de que un proceso hijo termine.
        
    - exit(): Termina la ejecución del proceso y devuelve un código de estado.

**Manejo de Archivos**
	Permiten leer, escribir, crear y modificar los atributos de los archivos en el almacenamiento.

-  `read(file, buffer, nbytes)` lee una cantidad definida de bytes de un archivo y los deposita en un buffer de memoria temporal.
- `open()` (abrir un archivo), 
- `write()` (escribir datos) y 
- `close()` (cerrar el archivo).
- `touch` (cambia fechas de acceso y modificación) 
- `chmod` (modifica los permisos de lectura, escritura o ejecución) 
- `chown` o `chgrp` (cambian el propietario o el grupo del archivo).
- `ls` (listar) 
- `cd` (cambiar directorio)
- `cp` (copiar)
- `rm` (borrar)
- `chmod` (cambiar permisos de lectura, escritura y ejecución)
- `chown` (cambiar propietario).

**Mantenimiento de Información del Sistema**
Permiten consultar y alterar parámetros de la configuración operativa, gestionar tiempos o manipular señales de interrupción del sistema.
    
- `alarm()`: Configura el reloj de alarma del sistema para que envíe una notificación en una cantidad de segundos.
- `pause()`: Suspende al proceso llamador hasta que el sistema intercepte la próxima señal.
- `sigaction()`: Define la acción específica que debe ejecutar el sistema al recibir una señal determinada.
- `kill()`: Envía una señal a un proceso objetivo, usualmente para forzar su terminación.
 
**Comunicaciones (y Sincronización)**
Coordinan el intercambio de información, los mensajes y el orden de ejecución entre múltiples procesos que funcionan al mismo tiempo (concurrencia).
Comunicaciones puras: Llamadas como `pipe()` (crea una tubería de comunicación en memoria) o `socket()` (abre una conexión de red).

**Manejo de Dispositivos**
Gestionan el hardware periférico y solicitan acceso exclusivo o de lectura/escritura a recursos físicos como impresoras, discos extraíbles o pantallas.

- `ioctl()` (input/output control en UNIX), que permite manipular parámetros muy específicos del hardware que no se ajustan a una simple lectura o escritura, como expulsar una bandeja de CD o configurar la velocidad de un puerto serie.
## Explicación practica 1.1
Sistemas de archivos  
- Directorios más importantes según FHS (Filesystem Hierarchy Standard) 
- / Tope de la estructura de directorios. Es como el C:\ • /home Se almacenan archivos de usuarios (Mis documentos) 
- /var Información que varía de tamaño (logs, BD, spools) 
- /etc Archivos de configuración 
- /bin Archivos binarios y ejecutables 
- /dev Enlace a dispositivos 
- /usr Aplicaciones de usuarios
**Proceso de arranque:**
- BIOS: inicia el HW y ejecuta MBC (Master Boot Code) que es codigo.
- **MBR (Master Boot Record)** es el primer sector físico del disco duro (Cilindro 0, Cabeza 0, Sector 1) y ocupa 512 bytes. Contiene el MBC (446 bytes), la **Tabla de Particiones** (64 bytes) y una firma de 2 bytes.
- **Gestor de Arranque (Bootloader):** El MBC lanza el bootloader (como **GRUB**), cuya función es cargar en memoria la imagen del Kernel del sistema operativo para ejecutarlo. Debido a la limitación de 446 bytes en el MBR, gestores como Grub Legacy debían instalarse en múltiples etapas (fase 1 en el MBR, fase 1.5 en el espacio vacío adyacente o _MBR gap_, y fase 2 para la interfaz y carga final). Grub 2, la versión moderna, simplifica estas etapas y soporta más configuraciones.
- **SysV init:** Su función es cargar todos los subprocesos necesarios para el correcto funcionamiento del Sistema Operativo. El proceso init (ejecutado desde /sbin/init) posee el PID 1. En SysV init se lo configura a través del archivo /etc/inittab. 4. No tiene padre y es el padre de todos los procesos (pstree). Es el encargado de montar los filesystems y de hacer disponible los demás dispositivos.
  1. Se empieza a ejecutar el código del BIOS/UEFI.
  2. El BIOS ejecuta el POST para verificar componentes de hardware.
  3. El BIOS lee el sector de arranque primario (MBR).
  4. Se carga el gestor de arranque mediante el MBC (*Master Boot Code*).
  5. El *bootloader* transfiere a la memoria RAM el Kernel y el *initrd*.
  6. Se monta el *initrd* como sistema de archivos raíz temporal y se inicializan componentes esenciales.
  7. El Kernel ejecuta el proceso `init` (PID 1) y desmonta el *initrd*.
  8. El proceso `init` lee el archivo de configuración `/etc/inittab`.
  9. Se ejecutan los scripts apuntados por el runlevel 1.
  10. La finalización del runlevel 1 indica el pasaje al runlevel por defecto.
  11. Se ejecutan los scripts del runlevel por defecto.
  12. El sistema queda listo para operar y presenta el prompt de login.
- **Runlevels:** son modos/estados de operacion preconfig en el SO, inicia o detiene servicios segun las necesidades.Se encuentran definidos en el archivo /etc/inittab: id:runlevels:acción:proceso
  - id: identifica la entrada en inittab (1 a 4 caracteres). 
  - runlevels: el/los runlevels en los que se realiza la acción 
  - acción: indica cómo se ejecutará proceso 
  - wait, initdefault, ctrlaltdel, off, respawn, once, sysinit, boot, bootwait, powerwait, etc. 
  - proceso: el comando exacto que será ejecutado.
  Niveles: 
  * `0`: *Halt* (parada o apagado total).
  * `1` / `S`: *Single-user mode* (modo monousuario de mantenimiento).
  * `2`: Modo multiusuario sin soporte de red.
  * `3`: Modo multiusuario en consola con red.
  * `4`: No utilizado / reservado para personalizaciones.
  * `5`: Modo multiusuario con entorno gráfico (*X11*).
  * `6`: *Reboot* (reinicio).
- **SystemD:** administrador de sistema y gestor de servicios Mejora el paralelismo de arranque.
  - El demonio systemd reemplaza al proceso init y es el que tiene PID 1.
  - Los runlevels son reemplazados por targets. 
  - No utiliza el archivo de configuración /etc/inittab.
  - Las unidades de trabajo son denominadas units y tienen distintos tipos: 
    - **Service**: controla un servicio particular (.service). 
    - **Socket**: encapsula IPC, un socket del sistema o file system FIFO (.socket) → socket-based activation. 
    - **Target**: agrupa units o establece puntos de sincronización durante el arranque (.target) → dependencia de unidades. 
    - **Snapshot**: almacena el estado de un conjunto de unidades para que pueda ser restablecido más tarde (.snapshot). 
    - Las **units** pueden tener dos estados → active o inactive.
    - **systemctl** comando para consultar y administrar el estado del sistema y sus *units*. Permite iniciar (`start`), detener (`stop`), reiniciar (`restart`), habilitar en el arranque (`enable`), deshabilitar (`disable`) y comprobar el estado (`status`) de los servicios.
    - **cgroups:** permite organizar un gp de procesos en forma jerarquica, procesos que esten relacionados. 
    - **fstab:** define particiones se montan al arranque.
      - user: cualquier usuario puede montar la partición. 
      - auto: monta la partición al inicio. 
      - ro: read only
      - rw: read and write.
    ![[Pasted image 20261001144807.png]]
- **EFI (Extensible Firmware Interface):** Es un estándar propiedad de Intel diseñado para la comunicación entre el sistema operativo y el firmware. Su objetivo es sustituir al viejo MBR utilizando el esquema GPT, solucionando así limitaciones históricas como la restricción en la cantidad máxima de particiones.
- **GPT (GUID Partition Table):** Es el formato de tabla de particiones que forma parte de EFI, caracterizado por:
    
    - Utilizar el Direccionamiento Lógico de Bloques (LBA) en lugar del antiguo sistema de cilindro-cabeza-sector.
        
    - Conservar un MBR "heredado" en el primer bloque (LBA 0) puramente por razones de compatibilidad con BIOS.
        
    - Ubicar su cabecera principal en el LBA 1, seguida de la tabla de particiones.
        
    - Ofrecer redundancia y mayor seguridad al guardar copias exactas de la cabecera y la tabla tanto al principio como al final del disco.
## Explicacion practica 1.2
**Configuración de discos IDE**
- los roles _Master_ y _Slave_.
-  `/dev/hda` (Master 1° bus), 
- `/dev/hdb` (Slave 1° bus
-  `/dev/hdc` (Master 2° bus) 
- `/dev/hdd` (Slave 2° bus).
    
- Introduce la numeración de particiones: del 1 al 4 para particiones primarias y del 5 en adelante para lógicas.
**Configuración de discos SCSI**
- Describe la interfaz SCSI basada en LUN.
- Identificación de dispositivos según bus: `/dev/sda`, `/dev/sdb`, `/dev/sdc`, etc.
- Especifica que las particiones primarias van de la 1 a la 4 (únicas que pueden marcarse como activas/booteables) y las particiones extendidas alojan lógicas a partir del número 5.
- Los discos sata usan misma nomenclatura
**Mecanismos modernos de identificación persistente**

- Explica que desde Debian/Squeeze los discos `hdX` pasaron a denominarse `sdX`.
    
- Muestra dos mecanismos persistentes principales:
    
    - Por **UUID** (identificador único universal) en `/dev/disk/by-uuid/`.
        
    - Por **Labels** (etiquetas de volumen) en `/dev/disk/by-label/`.
### 7. Particiones
* **Definición:** Forma de dividir el disco físico de manera lógica[cite: 2]. 
* **Tipos de particiones:**
  * **Primaria:** División básica directa del disco (máximo **4 por disco**)[cite: 2].
  * **Extendida:** Partición primaria especial que actúa como contenedor para alojar particiones lógicas[cite: 2].
  * **Lógica:** Particiones creadas dentro del espacio de la partición extendida para superar el límite de 4[cite: 2].
* **Ventajas:** Permite aislar el SO de los datos personales, facilita las tareas de respaldo (**backup**) y da soporte de **arranque múltiple**[cite: 2, 3].
* **Desventajas:** Desperdicio o **fragmentación estática** de espacio si se dimensionan de forma inadecuada durante la instalación[cite: 2].
* **Discos IDE:** Se identifican históricamente con el prefijo `/dev/hd`[cite: 2]. El disco maestro del canal primario es `/dev/hda`, el esclavo `/dev/hdb`, y sus particiones se numeran `/dev/hda1`, `/dev/hda2`, etc[cite: 2].
* **Discos SCSI / SATA / SSD / USB:** Se identifican con el prefijo `/dev/sd`[cite: 4, 5]. El primer disco físico es `/dev/sda`, el segundo `/dev/sdb`, y sus particiones se numeran `/dev/sda1`, `/dev/sda2`, etc[cite: 4, 5].
* **Numeración:** Del **1 al 4** se reservan para particiones primarias o extendidas; las particiones lógicas comienzan obligatoriamente desde el número **5 en adelante**.
### c. Cantidad mínima de particiones para instalar GNU/Linux:
* Como mínimo se necesita **1 partición**[cite: 2, 3]:
  * **Punto de montaje:** `/` (directorio raíz)[cite: 2, 3].
  * **Tipo de partición:** Primaria[cite: 3, 5].
  * **Tipo de File System:** `ext4` (por defecto), `ext3` o `ext2`[cite: 2, 3, 5].
  * **Identificación:** Por ejemplo, `/dev/hda3` o `/dev/sda1`[cite: 2, 3, 5].
* *(Recomendación: Se sugiere crear al menos **2 particiones**: el directorio raíz `/` y una de memoria de intercambio o **SWAP** en `/dev/hda4`)*[cite: 2, 3].
### d. Ejemplos de casos de particionamiento según la tarea:
* Separar los datos del usuario (`/home`) de las aplicaciones o del sistema operativo[cite: 2, 3]. 
* Crear una partición exclusiva para **restauración (restore)** de todo el sistema[cite: 2, 3]. 
* Ubicar el **Kernel** (`/boot`) en una partición de solo lectura, o en una que no se monte por motivos de seguridad[cite: 2, 3]. 
### f. Tipos de software para particionar:
* **Destructivos:** Solo permiten crear y eliminar particiones (ejemplo: `fdisk`)[cite: 2, 3].  
* **No destructivos:** Permiten crear, eliminar y además **modificar/redimensionar** particiones existentes sin perder datos (ejemplos: `fips`, `gparted`)[cite: 2, 3].
### Usuarios:
archivos son utilizados en GNU/Linux para guardar la información de usuarios:
* **`/etc/passwd`:** Almacena los datos principales de las cuentas (nombre de usuario, UID, GID primario, comentario, ruta del directorio home y shell predeterminada)
* **`/etc/shadow`:** Almacena de forma segura y cifrada las contraseñas de los usuarios y las políticas de expiración
* **`/etc/group`:** Almacena la definición de los grupos del sistema y sus miembros asociados[cite: 1].
* **UID (*User Identifier*):** Identificador numérico único asignado a cada usuario para gestionar permisos y accesos
* **GID (*Group Identifier*):** Identificador numérico asignado a cada grupo para la gestión colectiva de privilegios
* **Coexistencia de UIDs:** Sí, técnicamente pueden coexistir si se configuran de forma manual en `/etc/passwd`[cite: 1]. Sin embargo, representa una mala práctica de seguridad porque para el Kernel ambos nombres compartirán exactamente los mismos permisos y privilegios sobre los recursos
* **usuario root**: Es el superusuario y administrador global con privilegios absolutos sobre el sistema operativo[cite: 1].
* **UID:** Su identificador numérico siempre es **`0`**[cite: 1].
* **Múltiples perfiles:** Sí, es posible crear otra cuenta con facultades totales asignándole manualmente el **UID 0** en el archivo `/etc/passwd`[cite: 1].
### Permisos:
- u: El usuario dueño del archivo.
- g: El grupo asignado al archivo.
- o: El resto de los usuarios del sistema.
- Permisos básicos:
- r: read permite ver contenido archivo. Valor 4 octal.
- w: write permite mod o eliminar archivo. Valor 2 octal.
- x: permite ejecutar archivo si es un script/programa. Valor 1 octal.
### Comandos del entorno:
- **`cd`:** Cambia el directorio de trabajo actual.
* **`mkdir`:** Crea nuevos directorios dentro del sistema de archivos.
* **`rmdir`:** Elimina directorios exclusivamente cuando se encuentran vacíos.
* **`ln`:** Crea enlaces hacia archivos; por defecto genera enlaces duros y con el parámetro `-s` crea enlaces simbólicos.
* **`tail`:** Muestra las últimas líneas de un archivo (10 por defecto)[cite: 1, 3]. Admite `-n` para especificar la cantidad y `-f` para monitorizarlo en tiempo real[cite: 1, 3].
* **`locate`:** Realiza búsquedas rápidas de archivos a través de una base de datos indexada[cite: 1].
* **`ls`:** Lista los ficheros y carpetas de un directorio[cite: 1, 3]. Parámetros comunes: `-l` (detallado) y `-a` (incluye ocultos)[cite: 1, 3].
* **`pwd`:** Imprime en pantalla la ruta absoluta del directorio donde se encuentra posicionado el usuario[cite: 1, 3].
* **`cp`:** Copia archivos o directorios[cite: 1, 3]. Admite `-r` para realizar copias recursivas de carpetas completas[cite: 1, 3].
* **`mv`:** Mueve o renombra ficheros y directorios[cite: 1, 3].
* **`find`:** Busca archivos en tiempo real recorriendo el árbol de directorios según criterios como `-name` (nombre) o `-type` (tipo)[cite: 1, 3].
## Procesos 1
- **Proceso:** programa en ejecucion, es dinamico, tiene PC, existe desde que se solicita hasta que termina ejecutar
- **Programa:** es estatico 
- Componentes de un proceso:
  - Sección de Código (texto) 
  - Sección de Datos (variables globales) 
  - Stack(s) (datos temporarios: parámetros , variables temporales y direcciones de retorno)
- **Stacks:** se crean automaticamente y se ajusta en run-time, esta formado por *stack frames* pushed al llamar rutina y popped cuando retorna. El *Stack frame* tiene parametros de la rutina, datos para recuperar el stack frame anterior.
- **Atributos**: 
  - id proceso y id proceso padre
  - id del usuario que disparo
  - gp que lo disparo
  - en multiusuario desde que terminal y quien lo ejecuto 
- **Process Control Block(PCB):** Estructura de datos asociada al proceso, una por proceso, primero que se crea cuando se crea un proceso y ultimo que se borra cuando termina. Contiene la información asociada con cada proceso: 
  - PID, PPID, etc 
  - Valores de los registros de la CPU (PC, AC, etc) 
  - Planificación (estado, prioridad, tiempo consumido, etc) 
  - Ubicación (representación) en memoria 
  - Accounting 
  - Entrada salida (estado, pendientes, etc)
- **Espacio de direcciones de un proceso:** conjunto de direcciones de memoria que ocupa el proceso(strack, text y datos), no incluye su pcb, depende el modo tiene acceso a disitnas direcciones.
- **Contexto de un proceso:** incluye info que el so necesita para admin proceso y la cpu necesita para ejecutarlo, incluye reg cpu, pc, prioridad  etc.
- **cambio de contexto:** cuando la CPU deja de ejecutar un proceso para comenzar a ejecutar otro. El sistema operativo resguarda el contexto del proceso saliente (guardándolo en su PCB) y carga el contexto del proceso entrante para reanudarlo, lo cual representa tiempo de procesamiento no productivo.
- Kernel Enfoques: 
  - **Enfoque 1: El Kernel como entidad independiente**
    El Kernel se ejecuta completamente fuera de los procesos de usuario, operando como una entidad autónoma. Tiene asignada su propia región de memoria exclusiva y cuenta con su propio _stack_ (pila). Cuando un proceso sufre una interrupción o invoca una llamada al sistema, el sistema operativo debe resguardar el contexto de ese proceso y transferirle el control de la CPU al Kernel. Una vez que el Kernel finaliza su intervención administrativa, le devuelve el control al mismo proceso o planifica la ejecución de uno diferente. En esta arquitectura (común en los primeros sistemas operativos), el Kernel **no es un proceso**; el concepto de proceso aplica únicamente a los programas de usuario.
  - **Enfoque 2: El Kernel "dentro" del Proceso**
    El código, los módulos y las rutinas del Kernel residen integrados directamente dentro del espacio de direcciones de cada proceso de usuario en el sistema.
    El Kernel no actúa de forma aislada, sino que se ejecuta en el mismo contexto del proceso que está activo en ese momento.
    Para mantener la seguridad y la separación lógica, cada proceso posee dos _stacks_ independientes: uno para operar de manera estándar (modo usuario) y otro reservado para ejecutar rutinas privilegiadas (modo kernel).
    Las llamadas al sistema o interrupciones se gestionan realizando un "cambio de modo" en lugar de un cambio de contexto completo. El procesador eleva sus privilegios para ejecutar la porción del Kernel compartida dentro de ese mismo proceso, lo cual consume menos recursos y mejora notablemente la performance general del sistema.
## Procesos 2
### Estados de un proceso 
- **Nuevo:** El proceso es creado por un proceso padre, se instancian sus estructuras internas y aguarda en la cola para ser cargado en la memoria.
    
- **Listo:** El proceso se encuentra cargado en la memoria principal y únicamente espera que el planificador le asigne la CPU.
    
- **En ejecución:** El proceso posee el control del procesador hasta que agota su _quantum_ de tiempo, finaliza sus tareas o requiere realizar una operación de Entrada/Salida (E/S).
    
- **En espera:** El proceso se suspende y libera la CPU porque aguarda la ocurrencia de un evento externo, como la finalización de una E/S o la recepción de una señal. Una vez cumplido el evento, retorna inmediatamente al estado "listo".
- **Terminado**
### Estructuras de Colas

- El Sistema Operativo organiza la planificación enlazando los Bloques de Control de Proceso (PCB) dentro de diferentes colas lógicas.
    
- **Cola de trabajos:** Agrupa a todas las PCB de los procesos que existen en el sistema.
    
- **Cola de procesos listos (_Ready queue_):** Contiene a los procesos que ya residen en la memoria principal y están en condiciones inmediatas de competir por el uso de la CPU.
    
- **Colas de dispositivos:** Agrupan a los procesos que han pasado al estado de espera y aguardan la disponibilidad de un periférico específico de Entrada/Salida.
### Módulos de Planificación (Schedulers)

- Son componentes de software del Kernel que se activan ante eventos de creación, terminación, sincronización o interrupciones de reloj. Se clasifican según su frecuencia de ejecución:
    
- **Long Term Scheduler (Largo Plazo):** Administra el grado de multiprogramación dictando la cantidad total de procesos que ingresan a la memoria. Interactúa con el módulo **Loader**, encargado de cargar físicamente el programa desde el disco a la memoria.
    
- **Short Term Scheduler (Corto Plazo):** Determina sistemáticamente qué proceso de la cola de listos será el siguiente en ocupar la CPU. Se complementa con el módulo **Dispatcher**, el cual efectúa el cambio de contexto, conmuta el modo de ejecución y salta a la instrucción correspondiente para ceder el control al proceso elegido.
    
- **Medium Term Scheduler (Mediano Plazo):** Regula dinámicamente el equilibrio del sistema mediante la técnica de _swapping_. Si es necesario reducir la congestión, traslada temporalmente procesos desde la memoria hacia el disco (_swap out_) y posteriormente los reincorpora (_swap in_) cuando se normalizan los recursos.
### Comportamiento y Algoritmos de Planificación

- Durante su ciclo de vida, los procesos alternan entre
  - CPU (_CPU-bound_) y ráfagas de espera por operaciones de E/S (_I/O-bound_). 
  - Los procesos _I/O-bound_ requieren ser despachados velozmente para mantener los periféricos ocupados y maximizar la eficiencia general.
    
- **Algoritmos No Apropiativos (_Nonpreemptive_):** El proceso mantiene el control ininterrumpido de la CPU hasta que la libera de manera voluntaria, ya sea finalizando o bloqueándose por E/S. Son idóneos para **sistemas por lotes (_batch_)** donde no hay usuarios interactivos, y se prioriza el volumen de trabajos por hora (ejemplos: FCFS, SJF).
    
- **Algoritmos Apropiativos (_Preemptive_):** El sistema operativo tiene la facultad de interrumpir y expulsar a un proceso de la CPU en contra de su voluntad. Son indispensables en **sistemas interactivos** para garantizar equidad, evitar acaparamientos y mantener un tiempo de respuesta rápido ante las peticiones del usuario (ejemplos: _Round Robin_, Prioridades, SRTF, Colas Multinivel).

 - **Procesos por lotes (Batch):** Este tipo de entorno se caracteriza por la **ausencia de interacción directa con usuarios** esperando una respuesta en una terminal. Dado que no hay urgencia interactiva, se suelen emplear **algoritmos no apropiativos** (donde el proceso retiene la CPU hasta que finaliza voluntariamente). Sus metas principales son:
   **Rendimiento:** Maximizar la cantidad de trabajos procesados por hora.
   **Uso de la CPU:** Mantener el procesador ocupado la mayor cantidad de tiempo posible.
   **Tiempo de retorno:** Minimizar el lapso transcurrido desde que un trabajo comienza hasta que finaliza (aunque esto implique sacrificar el tiempo de espera inicial en la cola).
   **Ejemplos de algoritmos:** FCFS (_First Come First Served_) y SJF (_Shortest Job First_).
- **Procesos Interactivos:** Estos procesos requieren interactuar fluidamente, ya sea directamente con un usuario final (ej. un reproductor de música) o atendiendo múltiples requerimientos simultáneos (ej. un servidor). En estos entornos es estrictamente necesario el uso de **algoritmos apropiativos** para evitar que un solo proceso acapare la CPU y bloquee el sistema. Sus metas principales son:
  **Tiempo de respuesta:** Garantizar que el sistema responda a las peticiones con la mayor rapidez posible.
  **Proporcionalidad:** Cumplir con las expectativas del usuario (por ejemplo, si el usuario presiona "Stop" en un reproductor multimedia, el sonido debe detenerse en un lapso de tiempo considerablemente corto y perceptible).
- **Procesos en Tiempo Real:** Aunque no se detalla extensamente en el fragmento provisto, los sistemas en tiempo real se caracterizan por manejar procesos que están sujetos a **restricciones temporales críticas y plazos estrictos** (_deadlines_). El objetivo principal de su planificación no es la equidad ni el rendimiento masivo, sino garantizar que cada proceso crítico se ejecute y entregue su resultado dentro de una ventana de tiempo predefinida y absoluta, ya que un retraso podría causar una falla sistémica grave.
- **Política Versus Mecanismo:** El desarrollo del sistema operativo separa las responsabilidades. El Kernel provee el mecanismo inalterable (cómo se realiza el cambio de contexto o se evalúa la cola), mientras que el usuario o administrador define la política (qué proceso es más importante) alterando los parámetros del algoritmo, como al modificar la prioridad de ejecución mediante comandos específicos.

1. Ejecución en modo usuario 
2. Ejecución en modo kernel  
3. El proceso está listo para ser ejecutado cuando sea elegido. 
4. Proceso en espera en memoria principal. 
5. Proceso listo, pero el swapper debe llevar al proceso a memoria ppal antes que el kernel lo pueda elegir para ejecutar. Explicación por estado (cont.) 
6. Proceso en espera en memoria secundaria. 
7. Proceso retornando desde el modo kernel al user. Pero el kernel se apropia, hace un context switch para darle la CPU a otro proceso. 
8. Proceso recientemente creado y en transición: existe, pero aun no está listo para ejecutar, ni está dormido. 
9. El proceso ejecutó la system call exit y está en estado zombie. Ya no existe más, pero se registran datos sobre su uso, codigo resultante del exit. Es el estado final.
## Proceso 3 
- **Creacion de procesos:** un proceso es creado por otro proceso, un proceso padre tiene uno o mas hijos.
  ![[Pasted image 20261001194758.png]]
- Las actividades internas del Sistema Operativo al crear un proceso incluyen: crear su Bloque de Control de Proceso (PCB), asignarle un identificador único (PID), alojar la memoria necesaria para sus regiones (Stack, Text y Datos) y preparar las estructuras de datos.

- Relación entre Padre e Hijo: **Ejecución:** Una vez creado el hijo, el proceso padre puede optar por seguir ejecutándose de manera simultánea (concurrente) al hijo, o puede pausar su ejecución para esperar a que el hijo termine su tarea.
  **Espacio de direcciones:**
  - En **UNIX**, el proceso hijo nace como un **duplicado exacto** del proceso padre, copiando su espacio de direcciones de memoria.
  - En **Windows**, se crea un espacio de direcciones completamente vacío y directamente se le carga el programa que debe ejecutar.
### Llamadas al Sistema (System Calls) para Creación

- **En UNIX:** El proceso se realiza en dos etapas utilizando dos llamadas distintas:
    1. **`fork()`:** Crea el nuevo proceso como una copia idéntica del llamador. El sistema operativo devuelve el valor `0` dentro del proceso hijo, un valor mayor a `0` (el PID del hijo) en el proceso padre, y un número negativo si falla la creación.
    2. **`execve()`:** Usualmente invocada por el hijo justo después del `fork()`, sirve para reemplazar la imagen de memoria clonada con el código del nuevo programa que realmente se quiere ejecutar.
### Terminación de procesos: 
- Un proceso finaliza su ejecución normalmente realizando la llamada `exit`, devolviendo así el control al sistema operativo.
    
- El proceso padre puede utilizar la llamada `wait` (o `waitpid`) para quedarse a la espera de sus hijos y recibir su código de estado o retorno una vez que finalizan.
    
- También es posible la terminación forzada de un hijo (mediante `kill`), o la **terminación en cascada**, que ocurre cuando un proceso padre termina y el sistema no le permite a los hijos continuar huérfanos, forzando la muerte de toda la descendencia.
### Ejemplo de Integración: ¿Cómo funciona un Shell (Terminal)?

El documento ilustra estos conceptos con el funcionamiento clásico de una consola de comandos (Shell):

- El shell ejecuta un ciclo infinito donde lee el comando escrito por el usuario.
    
- Llama a `fork()` para crear un proceso hijo.
    
- El proceso padre (el shell) se queda esperando mediante `waitpid()`.
    
- El proceso hijo ejecuta `execve()` para cargar e iniciar el comando solicitado por el usuario.
## Explicacion practica 3
### Tiempos de los procesos: 
  - CPU (TCPU): tiempo que efectivamente usa la CPU el proceso. 
  - Retorno (TR ): tiempo que transcurre entre que el proceso llega al sistema hasta que completa su ejecución. 
  - Espera (TE ): tiempo que el proceso se encuentra en el sistema esperando, es decir el tiempo que pasa sin ejecutarse (TR - TCPU) 
  - Promedios (TPR y TPE): tiempos promedio de Retorno y Espera. Promedio calculado de los tiempos individuales de cada proceso del lote.
### Algoritmos de Planificación de CPU

- **FIFO (First Come, First Served):** Es una política no apropiativa que selecciona siempre el proceso más antiguo de la cola. Aunque no prioriza a ningún tipo, en la práctica los procesos ligados a CPU (_CPU Bound_) suelen terminar en su primera ráfaga, mientras que los ligados a Entrada/Salida (_I/O Bound_) necesitan formarse múltiples veces.
    
- **SJF (Shortest Job First):** Política no apropiativa que selecciona el proceso con la ráfaga de CPU más corta, ordenando así la cola de listos. Su desventaja es que los procesos largos pueden sufrir inanición (_starvation_) si llegan constantemente procesos cortos.
    
- **SRTF (Shortest Remaining Time First):** Es la variante apropiativa (_preemptive_) de SJF. Evalúa y selecciona el proceso al que le resta menos tiempo para terminar su siguiente ráfaga, favoreciendo directamente a los procesos _I/O Bound_.
    
- **Round Robin (RR):** Es un algoritmo apropiativo basado en un reloj que asigna un bloque de tiempo fijo o _Quantum_ (Q) a cada proceso. Si el proceso no finaliza en ese tiempo, es expulsado de la CPU y reubicado al final de la cola. Si el _Quantum_ es muy pequeño, genera una alta sobrecarga por cambios de contexto. La variante más utilizada es el "Timer Variable", donde el contador se reinicia a Q cada vez que el proceso asume el control del procesador.
    
- **Prioridades:** Cada proceso recibe un valor de prioridad (donde el número menor indica mayor prioridad) y se despacha al proceso con la máxima prioridad. Existe una cola de listos por cada nivel. Para evitar la inanición de los procesos de baja prioridad, se aplica una técnica de envejecimiento (_Aging_) o penalización que modifica dinámicamente la prioridad durante el ciclo de vida del proceso
### Colas Multinivel 
- Los planificadores modernos combinan los algoritmos anteriores dividiendo la cola de listos en múltiples sub-colas según el tipo de proceso (procesos de sistema, interactivos, batch, etc.).

- Cuentan con un **planificador horizontal** (cada cola corre su propio algoritmo, como RR o FIFO) y un **planificador vertical** (decide a qué cola darle prioridad).
    
- Poseen **retroalimentación**, permitiendo que un proceso baje o suba de cola según su comportamiento.
    
- El documento expone un ejemplo con tres colas (Q0 con RR q=8, Q1 con RR q=16, y Q2 con FCFS) diseñado para que los procesos largos vayan cayendo hacia las colas de mayor _quantum_, beneficiando a los _CPU Bound_. En este escenario específico, se advierte que puede existir inanición para los procesos _I/O Bound_ si al sistema ingresan constantemente procesos ligados a la CPU.
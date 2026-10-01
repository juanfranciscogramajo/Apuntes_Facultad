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
- **SysV init:**
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

	 	**Trabajo Práctico N° 1**   
   
**Objetivo**  

El objetivo del presente trabajo práctico es que el estudiante se familiarice con los conceptos básicos del sistema operativo *GNU/Linux*, su instalación, organización, entorno y comandos principales. También se tratará el manejo de usuarios,  permisos y su sistemas de archivos. 


**Temas Incluidos** 

GNU/Linux, instalación y conceptos básicos, permisos, arranque, usuarios. 

organización interna. 

 

**1\. Características de GNU/Linux**

* **a. Características más relevantes:**

  * **Software Libre:** Garantiza la libertad de usar, estudiar, modificar y redistribuir el código bajo licencias como la GNU GPL. 

  * **Kernel Monolítico Híbrido:** Ejecuta los controladores en un espacio privilegiado, pero permite cargar y descargar módulos dinámicamente en tiempo de ejecución (*Loadable Kernel Modules*). 

  * **Portabilidad:** Se adapta y funciona en una amplia variedad de arquitecturas de hardware y procesadores. 

  * **Soporte de Virtualización:** Puede operar tanto como sistema anfitrión (*host*) o como invitado (*guest*) sobre diferentes hipervisores y emuladores. 

  * **Multitarea y Multiusuario:** Permite la ejecución concurrente de múltiples procesos y la sesión simultánea de diferentes usuarios garantizando aislamiento y seguridad. 

* **b. Comparación con otros Sistemas Operativos:**

  * **Windows:** Es software propietario de código cerrado con kernel híbrido; su portabilidad está más restringida a arquitecturas comerciales (x86/x64 y recientemente ARM).

  * **macOS:** Basado en kernel híbrido (XNU/Mach) y estándares UNIX, pero gran parte de sus capas superiores y controladores son de código cerrado y de uso exclusivo en hardware de Apple.

* **c. ¿Qué es GNU?**

  * Es un proyecto iniciado en 1983 para desarrollar un sistema operativo completo y compatible con Unix, compuesto en su totalidad por software libre. 

* **d. Breve historia del proyecto GNU:**

  * Fundado por Richard Stallman, quien en 1985 creó la *Free Software Foundation* (FSF). En 1990 el proyecto disponía de herramientas esenciales (editor Emacs, compilador GCC, bibliotecas del sistema), pero carecía de un núcleo funcional debido al estancamiento del desarrollo del núcleo *Hurd*. En 1992, las herramientas GNU se integraron con el kernel desarrollado por Linus Torvalds, completando el sistema operativo funcional GNU/Linux. 

* **e. Multitarea:**

  * Capacidad de un sistema operativo para alternar y procesar múltiples tareas o procesos concurrentemente. GNU/Linux hace uso activo de la multitarea preferente (*preemptive multitasking*), asignando tiempos de CPU y prioridades mediante el planificador del kernel. 

* **f. ¿Qué es POSIX?**

  * *Portable Operating System Interface*: Conjunto de estándares definidos por el IEEE que establece interfaces de programación de aplicaciones (API) y utilidades de línea de comandos para asegurar la compatibilidad y portabilidad del software entre sistemas derivados y similares a UNIX.

**2\. Distribuciones de GNU/Linux**

* **a. Definición y ejemplos:**

  * Una distribución (o *distro*) es un conjunto empaquetado que integra el kernel Linux, las herramientas del proyecto GNU, un sistema de gestión de paquetes, instaladores y aplicaciones adicionales. 

  * **Debian:** Destaca por su estabilidad estricta, software completamente libre y su gestor dpkg/apt. 

  * **Arch Linux:** Distribución minimalista enfocada en usuarios avanzados, con modelo de actualización continua (*rolling release*) y gestor pacman. 

  * **Red Hat Enterprise Linux (RHEL) / Fedora:** Enfocadas en estabilidad corporativa y empresarial (RHEL) o innovación continua (Fedora), usando paquetes RPM y gestores dnf/yum. 

  * **Slackware:** Una de las distribuciones más antiguas, enfocada en la simplicidad de diseño Unix tradicional y mínima intervención sobre el software original. 

* **b. Diferencias principales entre distribuciones:**

  * Gestor y formato de paquetes (.deb, .rpm, compilación desde fuentes). 

  * Ciclo de actualizaciones y versiones (estable/congelado vs. *rolling release*).

  * Herramientas de administración y configuración del sistema. 

  * Selección de entornos de escritorio y paquetería preinstalada por defecto. 

* **c. Debian (Objetivos y Cronología):**

  * **Objetivos:** Crear y mantener un sistema operativo universal, estable y 100% libre, sostenido de forma democrática por una comunidad voluntaria sin fines de lucro.

  * **Cronología básica:** Fundado en agosto de 1993 por Ian Murdock. En 1996 se adoptó el Manifiesto de Debian y la versión 1.1; a lo largo de las décadas se consolidó como la base directa de decenas de distribuciones modernas (como Ubuntu, Linux Mint y Kali Linux). 

**3\. Estructura de GNU/Linux**

* **a. Componentes fundamentales:**

  * **Kernel (Núcleo):** Intermediario directo entre el hardware y el software. 

  * **Shell (Intérprete de comandos):** Interfaz para recibir y traducir instrucciones del usuario. 

  * **Sistema de Archivos (Filesystem):** Organización y administración del almacenamiento de datos. 

* **b. Estructura básica del sistema:**

  * **Hardware:** Componentes físicos (CPU, RAM, discos, periféricos). 

  * **Espacio de Kernel (*Kernel Space*):** Controla drivers, administración de memoria, llamadas al sistema y planificación de procesos. 

  * **Espacio de Usuario (*User Space*):** Bibliotecas compartidas de GNU (como glibc), servicios/demonios, el Shell y aplicaciones de usuario. 

**4\. Kernel**

* **a. Funciones principales:**

  * Administración y asignación de la memoria RAM. 

  * Planificación y sincronización de procesos en la CPU. 

  * Gestión de controladores de dispositivos (*drivers*) e interrupciones de hardware. 

  * Control del acceso al sistema de archivos y redes. 

* **b. Múltiples kernels instalados:**

  * Sí, es completamente posible. Las distintas imágenes binarias del kernel coexisten dentro del directorio /boot (bajo nombres como vmlinuz-\<versión\>). Al iniciar la computadora, el gestor de arranque (como GRUB) permite al usuario seleccionar qué versión del kernel ejecutar. 

* **c. Directorio de ubicación:**

  * /boot. 

**5\. Intérprete de comandos (Shell)**

* **a. Definición y funciones:**

  * Programa en espacio de usuario que lee texto de entrada (órdenes), lo interpreta y solicita su ejecución al kernel a través de llamadas al sistema, devolviendo los resultados en pantalla. 

* **b. Intérpretes de comandos comunes:**

  * **sh (*Bourne Shell*):** El estándar histórico de UNIX; sintaxis simple, altamente portable pero con funciones interactivas limitadas. 

  * **bash (*Bourne Again Shell*):** Shell por defecto en la mayoría de distros GNU/Linux; incluye historial persistente, autocompletado avanzado y gestión robusta de redirecciones. 

  * **zsh (*Z Shell*):** Shell moderno con autocompletado contextual avanzado, corrección ortográfica de comandos y alta capacidad de personalización mediante temas y plugins. 

* **c. Ubicación de comandos (Path):**

  * **Internos (*built-in*):** Integrados en el propio binario del Shell en memoria (ej. cd, pwd, exit). 

  * **Externos:** Binarios ejecutables ubicados en rutas del disco especificadas dentro de la variable de entorno $PATH, tales como /bin, /sbin, /usr/bin o /usr/local/bin. 

* **d. ¿Por qué no es parte del Kernel?**

  * Para mantener la seguridad, estabilidad y modularidad del sistema. Si el Shell se ejecuta en espacio de usuario, un fallo o bloqueo del intérprete no compromete la integridad del núcleo. Además, permite que cada usuario elija o reemplace su interfaz sin modificar el núcleo del SO. 

* **e. Shell distinto por usuario:**

  * Sí. Cada cuenta tiene asignado su propio intérprete predeterminado en el último campo del archivo /etc/passwd (modificable con herramientas como chsh o usermod). 

**6\. Sistema de Archivos (File System) en Linux**

* **a. ¿Qué es?**

  * Es la estructura lógica y los métodos que implementa el sistema operativo para organizar, almacenar, consultar, nombrar y proteger los datos en dispositivos de almacenamiento secundario. 

* **b. Estructura básica y estándar FHS:**

  * Todo el árbol jerárquico parte de un único directorio raíz denominado /. 

  * **FHS (*Filesystem Hierarchy Standard*):** Estándar que unifica la nomenclatura y ubicación de carpetas y archivos en sistemas GNU/Linux y Unix. 

  * **Directorios clave:**

    * /bin: Comandos y binarios esenciales para todos los usuarios (ej. ls, cp, mv). 

    * /sbin: Binarios esenciales para la administración del sistema (ej. fdisk, reboot). 

    * /dev: Archivos especiales de representación de dispositivos de hardware (discos, puertos). 

    * /etc: Archivos de configuración del sistema y servicios. 

    * /home: Directorios personales de trabajo de los usuarios estándar. 

    * /root: Directorio personal del superusuario/administrador. 

    * /lib: Bibliotecas esenciales compartidas necesarias para los binarios del sistema. 

    * /proc: Sistema de archivos virtual residente en memoria con información de procesos y estado del kernel. 

    * /tmp: Archivos temporales creados por programas y usuarios. 

    * /usr: Aplicaciones secundarias, código fuente, manuales y utilidades de nivel de usuario. 

    * /var: Datos variables y dinámicos (registros de log en /var/log, colas de impresión, bases de datos). 

* **c. Sistemas de archivos soportados:**

  * **Nativos de Linux:** ext2, ext3, ext4, XFS, Btrfs, ReiserFS. 

  * **Compatibles/Otros:** FAT32 (vfat), NTFS, exFAT, ISO 9660, NFS.

Particiones:  

1. Definición. Tipos de particiones. Ventajas y Desventajas.  

   Forma de dividir el disco físico de manera lógica. 

   Primaria: división básica directa del disco max 4 x disco.

   Extendida: partición primaria especial de contenedor para alojar particiones lógicas

   Logica: Particiones creadas dentro del espacio dela partición extendido para superar el limite de 4\.

   Ventajas: permite aislar el SO de los datos perso, facilidad de respaldo y soporte de arranque multi

   Desventaja: Desperdicio o fragmentación estatica de espacio si se dimensionan mal en la instalación.

   2. ¿Cómo se identifican las particiones en *GNU/Linux*? (Considere discos **IDE**, **SCSI** y **SATA**).  

   **Discos IDE:** Se identifican históricamente con el prefijo /dev/hd. El disco maestro del canal primario es /dev/hda, el esclavo /dev/hdb, y sus particiones se numeran /dev/hda1, /dev/hda2, etc.

   **Discos SCSI / SATA / SSD / USB:** Se identifican con el prefijo /dev/sd. El primer disco físico es /dev/sda, el segundo /dev/sdb, y sus particiones se numeran /dev/sda1, /dev/sda2, etc.

   *Numeración:* Del 1 al 4 se reservan para particiones primarias/extendidas; las particiones lógicas comienzan siempre desde el número 5 en adelante.

   

   3. ¿Cuántas particiones son necesarias como mínimo para instalar *GNU/Linux*? Nómbrelas indicando tipo de partición, identificación, tipo de File System y punto de montaje. 

   Como mínimo se necesita **1 partición**. **Punto de montaje:** / (directorio raíz). **Tipo de partición:** Primaria. **Tipo de File System:** Ext4 (por defecto), ext3 o ext2. **Identificación:** Por ejemplo, /dev/hda3. *Se recomiendan al menos 2 particiones: / y una de SWAP en /dev/hda4)*.

   4. Dar ejemplos de diversos casos de particionamiento dependiendo del tipo de tarea que se deba realizar en su sistema operativo. 

   Separar los datos del usuario de las aplicaciones o del sistema operativo. 

   Crear una partición exclusiva para restauración (restore) del sistema. 

   Ubicar el Kernel en una partición de solo lectura, o en una que no se monta por seguridad. 

   5. ¿Es posible visualizar particiones del tipo FAT y NTFS (que son de Windows) en GNU/Linux? 

   Sí, es posible. Cada partición se puede formatear con sistemas destino como fat o ntfs.  Un sistema GNU/Linux puede tener una partición de Windows conviviendo en el disco (ej. /dev/hda1: DOS con Windows).

   6. ¿Qué tipo de software para particionar existe? Menciónelos y compare.  

   Destructivos: Solo permiten crear y eliminar particiones (ejemplo: fdisk).  

   No destructivos: Permiten crear, eliminar y además modificar particiones existentes (ejemplos: fips, gparted)

2. Arranque (*bootstrap*) de un Sistema Operativo:  

   1. ¿Qué es el **BIOS**? ¿Qué tarea realiza? 

   El BIOS (Basic I/O System) es el ncargado de iniciar la carga de SO a través del MBC, esta grabado en un chip ROM/NVRAM.

   2. ¿Qué es **UEFI**? ¿Cuál es su función?

   UEFI(Extensible Firmware Interface) es un estándar moderno para comunicación entre el SO y el firmware de la pc.  Define la ubi del gestor de arranque, exponer info de HW al bootloader y proveer un bootManager capaz de cargar apps y drivers desde un sist de arch UEFI como fat32.

   3. ¿Qué es el **MBR**? ¿Qué es el **MBC**? 

   MBR (Master Boot Record): Registro en primer sector del disco donde esta el cod de arranque 

   MBC (Master Boot Code): es el cod de arranque ubicad en el MBR, no ocupa mas de 446BY, lanza el prog de boot o gest de arranque.

   4. ¿A qué hacen referencia las siglas **GPT**? ¿Qué sustituye? Indique cuál es su formato.

   Guid Partition Table: es el sistema de particionado que utiliza la interfaz UEFI, sustituye el esquema de particiones del MBR permitiendo mas capacidad y numero ilimtado de particione en un disco.  

   5. ¿Cuál es la funcionalidad de un “Gestor de Arranque”? ¿Qué tipos existen? ¿Dónde se instalan? Cite gestores de arranque conocidos.

   Su función es cargar una imagen del Kernel(SO) desde alguna part a mem para ejecutarlo. Existen 2 modos: Directamente en el MBR o en el csector de arranque de una part especifica. EJ: GRUB, LILO, NTLFR, GAG, YAST.

   

   

   

   6. ¿Cuáles son los pasos que se suceden desde que se prende una computadora hasta que el Sistema Operativo es cargado (proceso de *bootstrap*)? 

   1\. Se empieza a ejecutar el código del BIOS.

   2\. El BIOS ejecuta el POST.

   3\. El BIOS lee el sector de arranque (MBR).

   4\. Se carga el gestor de arranque (MBC).

   5\. El bootloader carga el kernel y el initrd (initial ram disk).

   6\. Se monta el initrd como sistema de archivos raíz y se inicializan

   componentes esenciales (por ejemplo, el scheduler).

   7\. El Kernel ejecuta el proceso init y se desmonta el initrd.

   8\. Se lee el /etc/inittab.

   9\. Se ejecutan los scripts apuntados por el runlevel 1\.

   10\. El final del runlevel 1 le indica que vaya al runlevel por defecto.

   11\. Se ejecutan los scripts apuntados por el runlevel por defecto.

   12\. El sistema está listo para ser usado.

   7. Analice el proceso de arranque en *GNU/Linux* y describa sus principales pasos.  

   8. ¿Cuáles son los pasos que se suceden en el proceso de parada (*shutdown*) de *GNU/Linux*?  

   El sistema envía una señal de terminación a todos los procesos activos, desmonta de forma segura los sistemas de archivos (pasándolos a modo de solo lectura para evitar corrupción) y, finalmente, envía la señal de corte de energía al hardware o detiene la CPU.

   9. ¿Es posible tener en una PC *GNU/Linux* y otro Sistema Operativo instalado?  Justifique.  

   Sí, es totalmente posible. La arquitectura permite que cada sistema operativo sea instalado en una partición separada dentro del mismo disco físico.  Para poder elegir cuál iniciar, se hace uso de gestores de arranque múltiple, como GRUB (GRand Unified Bootloader). No obstante, durante la instalación se debe tener cuidado; si el instalador no detecta el SO previo, sobreescribir el gestor primario puede dejar temporalmente inaccesible al otro sistema.

       

3. Archivos y editores:  

   1. ¿Cómo se identifican los archivos en *GNU/Linux*?  

   Identificación de archivos: En GNU/Linux, los archivos se identifican internamente por su número de inodo (inode) y su ubicación en el árbol de directorios. A diferencia de Windows, las extensiones (como .txt o .exe) son opcionales y no determinan obligatoriamente el formato ni la función del archivo.

      2. Investigue el funcionamiento de los editores **vim, nano** y **mcedit**, y los comandos **cat,** **more y less**. 

   vim: Es un editor avanzado que funciona mediante modos (inserción, comando, visual). Requiere aprender atajos de teclado específicos para usarse.

   nano: Es un editor muy sencillo y directo, ideal para principiantes, que muestra las opciones de guardado y salida en la parte inferior de la pantalla.

   mcedit: Es el editor que viene integrado con el gestor Midnight Commander; es muy amigable y visualmente similar a editores clásicos de DOS.

    cat: Muestra todo el contenido de un archivo en la terminal de una sola vez.

   more: Es un paginador que permite leer archivos largos pausando pantalla por pantalla, pero solo permite avanzar.

   less: Es un paginador más avanzado que permite desplazarse libremente tanto hacia adelante como hacia atrás por el texto.

      3. Cree un archivo llamado “prueba.exe” en su directorio personal usando el **vim**. El mismo debe contener su número de alumno y su nombre.  

      4. Investigue el funcionamiento del comando **file**. Pruébelo con diferentes archivos. ¿Qué diferencia nota?  file: Su funcionalidad es determinar el tipo real de un archivo analizando su estructura interna (magic numbers) en lugar de confiar en su extensión. Si lo pruebas con el archivo "prueba.exe" (del punto c), la diferencia que notarás es que file te indicará que es un archivo de texto ASCII normal, ignorando la extensión ".exe".

      5. Investigue la funcionalidad y parámetros de los siguientes comandos 

| relacionados con el uso de archivos:  |  |  |
| :---- | ----- | :---- |
| cd   mkdir   rmdir  iv. 	ln  	v. 	tail  | vi.  vii.  viii. ix.  x.  | locate  ls   pwd  cp  mv  |
|  | xi.  | find   |

 

4. Indique qué comando es necesario utilizar para realizar cada una de las siguientes acciones. Investigue su funcionamiento y parámetros más importantes:  

   1. Cree la carpeta **ISOCSO**  

   2. Acceda a la carpeta  

   3. Cree dos archivos con los nombres **isocso.txt** e **isocso.csv**  

   4. Liste el contenido del directorio actual  

   5. Visualizar la ruta donde estoy situado  

   6. Busque todos los archivos en los que su nombre contiene la cadena “iso\*”  

   7. Informar la cantidad de espacio libre en disco  

   8. Verifique los usuarios conectados al sistema  

   9. Editar a el archivo **isocso.txt** e ingresar Nombre y Apellido  

   10. Mostrar en pantalla las últimas líneas de un archivo.  

        

5. Investigue el objetivo, parámetros  y ubicación (directorio) de los siguientes comandos:  

   Man: Muestra el manual de usuario de comandos y programas.	 Parametros comunes: \-k (busca una palabra clave). Ubicación: /usr/bin/man

   Shutdown: Apaga o reinicia el sistema de forma segura.	Parametros comunes: \-h (apagar), \-r (reiniciar), now (ahora). Ubicacion: /sbin/shutdown

   reboot: Reinicia el sistema operativo inmediatamente. Parametros comunes: \-f (fuerza el reinicio sin apagar servicios). Ubicacion: /sbin/reboot

   halt: Detiene el sistema (apaga) inmediatamente. Parametros comunes: \-f (forzar apagado).	Ubicacion: /sbin/halt

   uname: Muestra información del sistema operativo y hardware. Parametros comunes: \-a (toda la info), \-r (versión del Kernel). Ubicacion: /bin/uname

   dmesg: Imprime los mensajes del buffer del Kernel (útil para hardware). Parametros comunes:	\-c (limpia el buffer), \-T (fecha legible). Ubicacion:  /bin/dmesg

   lspci: Lista todos los buses PCI y los dispositivos conectados a ellos. Parametros comunes:	\-v (modo detallado), \-nn (muestra códigos).Ubicacion: /sbin/lspci

   at: Programa la ejecución de comandos para una única vez en el futuro. Parametros comunes: \-l (lista trabajos pendientes), \-r (borra). Ubicacion: /usr/bin/at

   head: Muestra las primeras líneas de un archivo de texto. Parametros comunes: \-n \[número\] (define cuántas líneas mostrar).Ubicacion: /usr/bin/head

   tail: Muestra las últimas líneas de un archivo de texto. Parametros comunes: \-n \[número\], \-f (sigue el archivo en tiempo real). Ubicacion: /usr/bin/tail 

 

6. Proceso de Arranque *SystemV* :  

   1. Enumere los pasos del proceso de inicio de un sistema GNU/Linux, desde que se prende la PC hasta que se logra obtener el login en el sistema.  

   1\. Se empieza a ejecutar el código del BIOS.

   2\. El BIOS ejecuta el POST.

   3\. El BIOS lee el sector de arranque (MBR).

   4\. Se carga el gestor de arranque (MBC).

   5\. El bootloader carga el kernel y el initrd (initial ram disk).

   6\. Se monta el initrd como sistema de archivos raíz y se inicializan

   componentes esenciales (por ejemplo, el scheduler).

   7\. El Kernel ejecuta el proceso init y se desmonta el initrd.

   8\. Se lee el /etc/inittab.

   9\. Se ejecutan los scripts apuntados por el runlevel 1\.

   10\. El final del runlevel 1 le indica que vaya al runlevel por defecto.

   11\. Se ejecutan los scripts apuntados por el runlevel por defecto.

   12\. El sistema está listo para ser usado.

   2. Proceso **INIT**. ¿Quién lo ejecuta? ¿Cuál es su objetivo?  

   Lo carga el Kernel al finalizar su carga y su objetivo es cargar los subprocesos para que el SO funcione correctamente. Es el padre de los procesos, tiene PID 1

   3. RunLevels. ¿Qué son? ¿Cuál es su objetivo?  

   Son los modos en que arranca GNU/Linux, su objetivo es iniciar o apagar una serie de servicios.

   4. ¿A qué hace referencia cada nivel de ejecución según el estándar? ¿Dónde se define qué Runlevel ejecutar al iniciar el sistema operativo? ¿Todas las distribuciones respetan estos estándares?  

   0 → halt (parada o apagado).

   • 1 → single-user mode (modo monousuario).

   • 2 → multi-user without network support (multiusuario sin soporte de red).

   • 3 → multi-user console mode (modo multiusuario en consola).

   • 4 → N/A (no se utiliza).

   • 5 → X11 (modo multiusuario con entorno gráfico basado en X.org).

   • 6 → reboot (reinicio).

   El runlevel por defecto se define en el archivo /etc/inittab. No todas las distribuciones respetan este estándar exacto; por ejemplo, Debian usa del 2 al 5 de forma idéntica, mientras que Red Hat los diferenciaba más estrictamente.

   5. Archivo /etc/inittab. ¿Cuál es su finalidad? ¿Qué tipo de información se almacena en el? ¿Cuál es la estructura de la información que en él se almacena? 

   Su finalidad es dictar las instrucciones principales para el proceso init. Almacena el runlevel por defecto y qué acciones tomar al cambiar de estado. Su estructura se divide por dos puntos (:): id:runlevel:accion:proceso (ejemplo: id:5:initdefault:).

   6. Suponga que se encuentra en el runlevel \<X\>. Indique qué comando(s) deberá ejecutar para cambiar al runlevel \<Y\>. ¿Este cambio es permanente? ¿Por qué?  

   Ejecutar como admin Init Y, seria hasta que apagues sino mod el por defecto

   7. Scripts RC. ¿Cuál es su finalidad? ¿Dónde se almacenan? Cuando un sistema GNU/Linux arranca o se detiene se ejecutan scripts, indique cómo determina qué script ejecutar ante cada acción. ¿Existe un orden para llamarlos? Justifique.

   Su finalidad es iniciar (start) o detener (stop) los demonios/servicios del sistema. Se almacenan físicamente en /etc/init.d/, pero se crean accesos directos en carpetas numeradas como /etc/rc5.d/ para cada runlevel. El sistema determina qué ejecutar y en qué orden basándose en el nombre de los accesos directos: los que empiezan con S (Start) se inician, y los que empiezan con K (Kill) se detienen. Tienen un orden numérico (ej. S20apache arranca antes que S99local) para asegurar que las dependencias lógicas se respeten.

       

7. *SystemD* (https://github.com/systemd/systemd):  

   8. ¿Qué es *systemd*?
      es un sistema que centraliza la admin de servicios y librerias del sistema
   9. ¿A qué hace referencia el concepto de *Unit* en SystemD?  
      son las unidades de trabajo.
   10. ¿Para qué sirve el comando *systemctl* en SystemD?  
       sirve para interactuar con sysD para controlar, administrar el estado del sistema y sus units Ej: start, stop, restart, enable, status.
   11. ¿A qué hace referencia el concepto de *target* en SystemD? 
       agrupa units o establece untos de sincronizacion en  el arranque.
   12. Ejecutar el comando *pstree*. ¿Qué es lo que se puede observar a partir de la ejecución de este comando?
       Se observa los procesos activos organizados en forma de arbol jerarquico. La raiz es sistemd o init.

13. Usuarios:  

   14. ¿Qué archivos son utilizados en un sistema GNU/Linux para guardar la información de los usuarios?
       $cat/etc/passwd nombre de usuario, id, nombre, interprete de comandos.
       $cat/etc/shadow guarda las contraseñas del usuario encriptado.
       $cat/etc/group guarda informacion y configuracion correspodiente a grupos del sistema.
   15. ¿A qué hacen referencia las siglas *UID* y *GID*? ¿Pueden coexistir UIDs iguales en un sistema GNU/Linux? Justifique. 
       UID: id unico que el so asigna a cada user para gestionar accesos, procesos y privilegios.
       GID: id numerico que representa gp de usuarios, que pertenece a una cuenta para la asignacion y control de permisos sobre archivos y recursos.
   16. ¿Qué es el usuario root? ¿Puede existir más de un usuario con este perfil en GNU/Linux? ¿Cuál es la *UID* de *root*? 
       Es el superusuario administrador del sistema, se puede mas de uno para eso se le debe asignar manualmente el UID 0 (UID root) en el /etc/passwd 
   17. Agregue un nuevo usuario llamado *isocso* a su instalación de GNU/Linux, especifique que su home sea creada en /home/*isocso*, y hágalo miembro del grupo *informatica* (si no existe, deberá crearlo). Luego, sin iniciar sesión como este usuario cree un archivo en su home personal que le pertenezca. Luego de todo esto, borre el usuario y verifique que no queden registros de él en los archivos de información de los usuarios y grupos.  

   18. Investigue la funcionalidad y parámetros de los siguientes comandos:
       useradd: añadir un usuario, modifica $cat/etc/passwd
       adduser: crear cuentas de usuario. -m direc home, -d <ruta> def home, -g <grupo> asigna gp primario, -s <shell> def shell x defecto
       groupadd: crea nuevo grupo en el sistema. -g <GID> asigna id, -r crea gp del sist.
       usermod: mod prop de una cuenta de usuario existente
       who: muestra info sobre users con sesion activa en sist.
       userdel: elimina cuenta de usuario del sist. -r ademas borra home y correo, -f elimina hasta con sesion iniciada
       groupdel: elimina gp existente.
       su: permite alternal la sesion hacia otro usuario o super
       passwd: permite cambiar la contra de un usuario.


 

19. FileSystem y permisos:  

   20. ¿Cómo son definidos los permisos sobre archivos en un sistema GNU/Linux?  
       Permisos de usuarios:
       u: El usuario duenio del archivo.
       g: El grupo asignado al archivo.
       o: El resto de los usuarios del sistema.
       Permisos basicos:
       r: read permite ver contenido archivo. Valor 4 octal.
       w: write permite mod o eliminar archivo. Valor 2 octal.
       x: permite ejecutar archivo si es un script/programa. Valor 1 octal.
   21. Investigue la funcionalidad y parámetros de los siguientes comandos relacionados con los permisos en GNU/Linux:
       chmod: cambia permisos de acceso de un directorio.
       chown: cambia el uuario propietario de un directorio.
       chgrp: cambia el grupo asignado a un directorio.

   22. Al utilizar el comando chmod generalmente se utiliza una notación octal asociada para definir permisos. ¿Qué significa esto? ¿A qué hace referencia cada valor?
       el modo octal sirve para definir proceso numericamente de 3 digitos, cada valor tiene asignado una accion y se puede sumar para obtener un digito del 0 al 7 que def combinacion de accesos.

   23. ¿Existe la posibilidad de que algún usuario del sistema pueda acceder a determinado archivo para el cual no posee permisos? Indiquelo y realice las pruebas correspondientes. 

   24. Explique los conceptos de “full path name” (path absoluto) y “relative path name” (path relativo). De ejemplos claros de cada uno de ellos.  

   25. ¿Con qué comando puede determinar en qué directorio se encuentra actualmente? ¿Existe alguna forma de ingresar a su directorio personal sin necesidad de escribir todo el path completo? ¿Podría utilizar la misma idea para acceder a otros directorios? ¿Cómo? Explique con un ejemplo. 

   26. Investigue la funcionalidad y parámetros de los siguientes comandos relacionados con el uso del FileSystem:  

| umount   du   df iv. 	mount    | mkfs   fdisk (con cuidado)   write  losetup  sta  |
| :---- | :---- |

 

10. Procesos:  

    1. ¿Qué significa que un proceso se está ejecutando en Background? ¿Y en Foreground? 

    2. ¿Cómo puedo hacer para ejecutar un proceso en Background? ¿Como puedo hacer para pasar un proceso de background a foreground y viceversa?  

    3. Pipe ( **|** ). ¿Cuál es su finalidad? Cite ejemplos de su utilización.  

    4. Redirección. ¿Qué tipo de redirecciones existen? ¿Cuál es su finalidad? Cite ejemplos de utilización.  

        

11. Otros comandos de Linux (Indique funcionalidad y parámetros):  

    1. ¿A qué hace referencia el concepto de empaquetar archivos en GNU/Linux?  

    2. Seleccione 4 archivos dentro de algún directorio al que tenga permiso y sume el tamaño de cada uno de estos archivos. Cree un archivo empaquetado conteniendo estos 4 archivos y compare los tamaños de los mismos. ¿Qué característica nota?  

    3. ¿Qué acciones debe llevar a cabo para comprimir 4 archivos en uno solo? Indique la secuencia de comandos ejecutados.  

    4. ¿Pueden comprimirse un conjunto de archivos utilizando un único comando?  

    5. Investigue la funcionalidad de los siguientes comandos:  

	i. 	tar  	ii. 	grep    
iii. 	gzip  	v. 	wc  iv. 	zgrep  

 

12. Indique qué acción realiza cada uno de los comandos indicados a continuación considerando su orden. Suponga que se ejecutan desde un usuario que no es root ni pertenece al grupo de root. (Asuma que se encuentra posicionado en el directorio de trabajo del usuario con el que se logueó). En caso de no poder ejecutarse el comando, indique la razón:  

    l s −l \> prueba  ps \> PRUEBA  chmod 710 prueba  chown root:root PRUEBA  chmod 777 PRUEBA  chmod 700 /etc/passwd  passwd root  rm PRUEBA  man /etc/shadow  find / −name ∗ .conf  

    usermod root −d /home/ newroot −L  cd / root  rm ∗  cd / etc  cp ∗ /home −R  shutdown  

     

13. Indique qué comando sería necesario ejecutar para realizar cada una de las siguientes acciones:  

    1. Terminar el proceso con *PID* 23\.  

    2. Terminar el proceso llamado *init* o *systemd*. ¿Qué resultados obtuvo?  

    3. Buscar todos los archivos de usuarios en los que su nombre contiene la cadena 

    “.conf”  

    4. Guardar una lista de procesos en ejecución el archivo **/home/\<su nombre de usuario\>/procesos**  

    5. Cambiar los permisos del archivo **/home/\<su nombre de usuario\>/xxxx** a: 

       1. Usuario: Lectura, escritura, ejecución  

          2. Grupo: Lectura, ejecución  

             3. Otros: ejecución 

    6. Cambiar los permisos del archivo **/home/\<su nombre de usuario\>/yyyy** a:  

       i. 	Usuario: Lectura, escritura.  ii. 	Grupo: Lectura, ejecución  

	iii. 	Otros: Ninguno  

7. Borrar todos los archivos del directorio **/tmp** 

   8. Cambiar el propietario del archivo **/opt/isodata** al usuario **isocso**  

   9. Guardar en el archivo **/home/\<su nombre de usuario\>/donde** el directorio donde me encuentro en este momento, en caso de que el archivo exista no se debe eliminar su contenido anterior.  

       

14. Indique qué comando sería necesario ejecutar para realizar cada una de las siguientes acciones:  

    1. Ingrese al sistema como usuario “root”  

    2. Cree un usuario. Elija como nombre, por convención, la primera letra de su nombre seguida de su apellido. Asígnele una contraseña de acceso.  

    3. ¿Qué archivos fueron modificados luego de crear el usuario y qué directorios se crearon? 

    4. Crear un directorio en /tmp llamado *miCursada*  

    5. Copiar todos los archivos de /var/log al directorio antes creado. 

    6. Para el directorio antes creado (y los archivos y subdirectorios contenidos en él) cambiar el propietario y grupo al usuario creado y grupo users.  

    7. Agregue permiso total al dueño, de escritura al grupo y escritura y ejecución a todos los demás usuarios para todos los archivos dentro de un directorio en forma recursiva.  

    8. Acceda a otra terminal para loguearse con el usuario antes creado. 

    9. Una vez logueado con el usuario antes creado, averigüe cuál es el nombre de su terminal.  

    10. Verifique la cantidad de procesos activos que hay en el sistema.  

    11. Verifiqué la cantidad de usuarios conectados al sistema.  

    12. Vuelva a la terminal del usuario root y envíele un mensaje al usuario anteriormente creado enviándole que el sistema va a ser apagado.  

    13. Apague el sistema.  

         

15. Indique qué comando sería necesario ejecutar para realizar cada una de las siguientes acciones:  

    14. Cree un directorio cuyo nombre sea su número de legajo e ingrese a él.  

    15. Cree un archivo utilizando el editor de textos *vi*, e introduzca su información personal: Nombre, Apellido, Número de alumno y dirección de correo electrónico. El archivo debe llamarse "LEAME".  

    16. Cambie los permisos del archivo LEAME, de manera que se puedan ver reflejados los siguientes permisos:  

        - Dueño: ningún permiso  

          - Grupo: permiso de ejecución  

          - Otros: todos los permisos  

    17. Vaya al directorio /etc y verifique su contenido. Cree un archivo dentro de su directorio personal cuyo nombre sea **leame** donde el contenido del mismo sea el listado de todos los archivos y directorios contenidos en /etc. ¿Cuál es la razón por la cuál puede crear este archivo si ya existe un archivo llamado "LEAME” en este directorio? 

    18. ¿Qué comando utilizaría y de qué manera si tuviera que localizar un archivo dentro del filesystem? ¿Y si tuviera que localizar varios archivos con características similares? Explique el concepto teórico y ejemplifique.  

    19. Utilizando los conceptos aprendidos en el punto anterior, busque todos los archivos cuya extensión sea .so y almacene el resultado de esta búsqueda en un archivo dentro del directorio creado en el primer inciso. El archivo deberá llamarse *ejercicioF*.  

         

16. Indique qué acción realiza cada uno de los comandos indicados a continuación considerando su orden. Suponga que se ejecutan desde un usuario que no es root ni pertenece al grupo de root. (Asuma que se encuentra posicionado en el directorio de trabajo del usuario con el que se logueó). En caso de no poder ejecutarse el comando indique la razón:  

    1. mkdir iso 

       2. cd . / iso; ps \> f0  

          3. ls \> f1  

             4. cd /  

                5. echo $HOME  

                6. ls −l $\> $HOME/ iso/ls  

                7. cd $HOME; mkdir f2  

                8. ls −ld f2  

                9. chmod 341 f2  

                10. touch dir  

                11. cd f2 

                12. cd \~/iso  

                13. pwd \> f3  

                14. ps | grep 'ps' | wc −l \>\> ../f2/f3  

                15. chmod 700 ../f2 ; cd ..  

                16. find . −name etc/passwd  

                17. find / −name etc/passwd   

                18. mkdir ejercicio5  

                19. . . . . . . . . . . . . . . . . . . . 20\. . . . . . . . . . . . . . . . . . . .  

    1. Inicie 2 sesiones utilizando su nombre de usuario y contraseña. En una sesión vaya siguiendo paso a paso las órdenes que se encuentran escritas en el cuadro superior. En la otra sesión, cree utilizando algún editor de textos un archivo que se llame “explicacion\_de\_ejercicio" dentro del directorio creado en el ejercicio 22 y, para cada una de los comandos que ejecute en la otra sesión, realice una breve explicación de los resultados obtenidos.  

    2. Complete  los comandos 19 y 20, de manera tal que realicen la siguiente acción:  

    19: Copiar el directorio iso y todo su contenido al directorio creado en 24.a  

    20: Copiar el resto de los archivos y directorios que se crearon en este ejercicio al directorio creado en el ejercicio 24.a 

    3. Ejecute las órdenes 19 y 20 y coméntelas en el archivo creado en el inciso a).  

 

17. Cree una estructura desde el directorio /home que incluya varios directorios, subdirectorios y archivos, según el esquema siguiente.  

![][image1] 

Asuma que “usuario” indica cuál es su nombre de usuario. Además deberá tener en cuenta que dirX hace referencia a directorios y fX hace referencia a archivos. Utilizando la estructura de directorios anteriormente creada, indique qué comandos son necesarios para realizar las siguientes acciones:  

1. Mueva el archivo "f3” al  directorio de trabajo /home/usuario.  

   2. Copie el archivo "f4” en  el directorio "dir11".  

   3. Haga los mismo que en el inciso anterior pero el archivo de destino, se debe llamar 

   "f7".  

   4. Cree el directorio copia dentro del directorio usuario y copie en él, el contenido de "dir1".  

   5. Renombre el archivo "f1" por el nombre *archivo* y vea los permisos del mismo.  

   6. Cambie los permisos del archivo llamado *archivo* de manera de reflejar lo siguiente:  

      - Usuario: Permisos de lectura y escritura  

        - Grupo: Permisos de ejecución 

          - Otros: Todos los permisos  

   7. Renombre los archivos "f3” y “f4" de manera que se llamen "f3.exe” y “f4.exe” respectivamente.  

   8. Utilizando un único comando cambie los permisos de los dos archivos renombrados en el inciso anterior, de manera de reflejar lo siguiente:  

      - Usuario: Ningún permiso 

        - Grupo: Permisos de escritura  

          - Otros: Permisos de escritura y ejecución  

         

18. Indique qué comando/s es necesario para realizar cada una de las acciones de la siguiente secuencia de pasos (considerando su orden de aparición):  

    1. Cree un directorio llamado *logs* en el directorio /tmp.  

    2. Copie todo el contenido del directorio /var/log en el directorio creado en el punto anterior.  

    3. Empaquete el directorio creado en a), el archivo resultante se debe llamar "misLogs.tar".  

    4. Empaquete y comprima el directorio creado en a), el archivo resultante se debe llamar "misLogs.tar.gz".  

    5. Copie los archivos creados en c) y d) al directorio de trabajo de su usuario.  

    6. Elimine el directorio creado en a), *logs*.  

    7. Desempaquete los archivos creados en c y d en 2 directorios diferentes. 

 

 

 de 10 

[image1]: <data:image/png;base64,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>
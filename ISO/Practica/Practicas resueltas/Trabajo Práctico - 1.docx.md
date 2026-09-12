# Objetivo  
El objetivo del presente trabajo práctico es que el estudiante se familiarice con los conceptos básicos del sistema operativo **GNU/Linux**, su **instalación**, **organización**, **entorno** y **comandos principales**. También se tratará el **manejo de usuarios**, **permisos** y su **sistemas de archivos**. 

---

## Temas Incluidos 
* **GNU/Linux**, **instalación** y **conceptos básicos**.
* **Permisos**, **arranque**, **usuarios**. 
* **Organización interna**. 

---

## 1. Características de GNU/Linux

### a. Características más relevantes:
* **Software Libre:** Garantiza la libertad de usar, estudiar, modificar y redistribuir el código bajo licencias como la **GNU GPL**. 
* **Kernel Monolítico Híbrido:** Ejecuta los controladores en un espacio privilegiado, pero permite cargar y descargar módulos dinámicamente en tiempo de ejecución (**Loadable Kernel Modules**). 
* **Portabilidad:** Se adapta y funciona en una amplia variedad de arquitecturas de hardware y procesadores. 
* **Soporte de Virtualización:** Puede operar tanto como sistema anfitrión (**host**) o como invitado (**guest**) sobre diferentes hipervisores y emuladores. 
* **Multitarea y Multiusuario:** Permite la ejecución concurrente de múltiples procesos y la sesión simultánea de diferentes usuarios garantizando **aislamiento y seguridad**. 

### b. Comparación con otros Sistemas Operativos:
* **Windows:** Es software propietario de código cerrado con **kernel híbrido**; su portabilidad está más restringida a arquitecturas comerciales (**x86/x64** y recientemente **ARM**).
* **macOS:** Basado en kernel híbrido (**XNU/Mach**) y estándares **UNIX**, pero gran parte de sus capas superiores y controladores son de código cerrado y de uso exclusivo en hardware de Apple.

### c. ¿Qué es GNU?
Es un proyecto iniciado en **1983** para desarrollar un sistema operativo completo y compatible con **Unix**, compuesto en su totalidad por **software libre**. 

### d. Breve historia del proyecto GNU:
Fundado por **Richard Stallman**, quien en **1985** creó la **Free Software Foundation (FSF)**. En **1990** el proyecto disponía de herramientas esenciales (editor **Emacs**, compilador **GCC**, bibliotecas del sistema), pero carecía de un núcleo funcional debido al estancamiento del desarrollo del núcleo **Hurd**. En **1992**, las herramientas GNU se integraron con el kernel desarrollado por **Linus Torvalds**, completando el sistema operativo funcional **GNU/Linux**. 

### e. Multitarea:
Capacidad de un sistema operativo para alternar y procesar múltiples tareas o procesos concurrentemente. GNU/Linux hace uso activo de la **multitarea preferente** (*preemptive multitasking*), asignando tiempos de CPU y prioridades mediante el **planificador del kernel**. 

### f. ¿Qué es POSIX?
**Portable Operating System Interface:** Conjunto de estándares definidos por el **IEEE** que establece interfaces de programación de aplicaciones (**API**) y utilidades de línea de comandos para asegurar la **compatibilidad y portabilidad** del software entre sistemas derivados y similares a UNIX.

---

## 2. Distribuciones de GNU/Linux

### a. Definición y ejemplos:
Una **distribución (o distro)** es un conjunto empaquetado que integra el kernel Linux, las herramientas del proyecto GNU, un sistema de gestión de paquetes, instaladores y aplicaciones adicionales. 
* **Debian:** Destaca por su estabilidad estricta, software completamente libre y su gestor `dpkg`/`apt`. 
* **Arch Linux:** Distribución minimalista enfocada en usuarios avanzados, con modelo de actualización continua (*rolling release*) y gestor `pacman`. 
* **Red Hat Enterprise Linux (RHEL) / Fedora:** Enfocadas en estabilidad corporativa y empresarial (RHEL) o innovación continua (Fedora), usando paquetes **RPM** y gestores `dnf`/`yum`. 
* **Slackware:** Una de las distribuciones más antiguas, enfocada en la simplicidad de diseño Unix tradicional y mínima intervención sobre el software original. 

### b. Diferencias principales entre distribuciones:
* **Gestor y formato de paquetes** (`.deb`, `.rpm`, compilación desde fuentes). 
* **Ciclo de actualizaciones y versiones** (estable/congelado vs. *rolling release*).
* **Herramientas de administración y configuración** del sistema. 
* **Selección de entornos de escritorio** y paquetería preinstalada por defecto. 

### c. Debian (Objetivos y Cronología):
* **Objetivos:** Crear y mantener un sistema operativo universal, estable y 100% libre, sostenido de forma democrática por una comunidad voluntaria sin fines de lucro.
* **Cronología básica:** Fundado en **agosto de 1993** por **Ian Murdock**. En **1996** se adoptó el **Manifiesto de Debian** y la versión 1.1; a lo largo de las décadas se consolidó como la base directa de decenas de distribuciones modernas (como **Ubuntu**, **Linux Mint** y **Kali Linux**). 

---

## 3. Estructura de GNU/Linux

### a. Componentes fundamentales:
* **Kernel (Núcleo):** Intermediario directo entre el hardware y el software. 
* **Shell (Intérprete de comandos):** Interfaz para recibir y traducir instrucciones del usuario. 
* **Sistema de Archivos (Filesystem):** Organización y administración del almacenamiento de datos. 

### b. Estructura básica del sistema:
* **Hardware:** Componentes físicos (CPU, RAM, discos, periféricos). 
* **Espacio de Kernel (Kernel Space):** Controla drivers, administración de memoria, llamadas al sistema y planificación de procesos. 
* **Espacio de Usuario (User Space):** Bibliotecas compartidas de GNU (como `glibc`), servicios/demonios, el Shell y aplicaciones de usuario. 

---

## 4. Kernel

### a. Funciones principales:
* Administración y asignación de la **memoria RAM**. 
* Planificación y sincronización de **procesos en la CPU**. 
* Gestión de **controladores de dispositivos (drivers)** e **interrupciones de hardware**. 
* Control del acceso al **sistema de archivos y redes**. 

### b. Múltiples kernels instalados:
**Sí, es completamente posible.** Las distintas imágenes binarias del kernel coexisten dentro del directorio `/boot` (bajo nombres como `vmlinuz-<versión>`). Al iniciar la computadora, el gestor de arranque (como **GRUB**) permite al usuario seleccionar qué versión del kernel ejecutar. 

### c. Directorio de ubicación:
`/boot`. 

---

## 5. Intérprete de comandos (Shell)

### a. Definición y funciones:
Programa en **espacio de usuario** que lee texto de entrada (órdenes), lo interpreta y solicita su ejecución al kernel a través de **llamadas al sistema**, devolviendo los resultados en pantalla. 

### b. Intérpretes de comandos comunes:
* **sh (Bourne Shell):** El estándar histórico de UNIX; sintaxis simple, altamente portable pero con funciones interactivas limitadas. 
* **bash (Bourne Again Shell):** Shell por defecto en la mayoría de distros GNU/Linux; incluye historial persistente, autocompletado avanzado y gestión robusta de redirecciones. 
* **zsh (Z Shell):** Shell moderno con autocompletado contextual avanzado, corrección ortográfica de comandos y alta capacidad de personalización mediante temas y plugins. 

### c. Ubicación de comandos (Path):
* **Internos (built-in):** Integrados en el propio binario del Shell en memoria (ej. `cd`, `pwd`, `exit`). 
* **Externos:** Binarios ejecutables ubicados en rutas del disco especificadas dentro de la variable de entorno `$PATH`, tales como `/bin`, `/sbin`, `/usr/bin` o `/usr/local/bin`. 

### d. ¿Por qué no es parte del Kernel?
Para mantener la **seguridad, estabilidad y modularidad** del sistema. Si el Shell se ejecuta en espacio de usuario, un fallo o bloqueo del intérprete no compromete la integridad del núcleo. Además, permite que cada usuario elija o reemplace su interfaz sin modificar el núcleo del SO. 

### e. Shell distinto por usuario:
**Sí.** Cada cuenta tiene asignado su propio intérprete predeterminado en el último campo del archivo `/etc/passwd` (modificable con herramientas como `chsh` o `usermod`).

## 6. Sistema de Archivos (File System) en Linux

### a. ¿Qué es?
Es la **estructura lógica** y los métodos que implementa el sistema operativo para **organizar, almacenar, consultar, nombrar y proteger** los datos en dispositivos de almacenamiento secundario[cite: 1, 2]. 

### b. Estructura básica y estándar FHS:
Todo el árbol jerárquico parte de un **único directorio raíz** denominado `/`[cite: 1, 2]. 

* **FHS (Filesystem Hierarchy Standard):** Estándar que unifica la nomenclatura y ubicación de carpetas y archivos en sistemas GNU/Linux y Unix[cite: 1, 2]. 
* **Directorios clave:**
  * `/bin`: Comandos y binarios esenciales para todos los usuarios (ej. `ls`, `cp`, `mv`)[cite: 1, 2]. 
  * `/sbin`: Binarios esenciales para la administración del sistema (ej. `fdisk`, `reboot`). 
  * `/dev`: Archivos especiales de representación de dispositivos de hardware (discos, puertos)[cite: 1, 2]. 
  * `/etc`: Archivos de configuración del sistema y servicios[cite: 2]. 
  * `/home`: Directorios personales de trabajo de los usuarios estándar[cite: 2]. 
  * `/root`: Directorio personal del superusuario/administrador[cite: 1]. 
  * `/lib`: Bibliotecas esenciales compartidas necesarias para los binarios del sistema. 
  * `/proc`: Sistema de archivos virtual residente en memoria con información de procesos y estado del kernel[cite: 1]. 
  * `/tmp`: Archivos temporales creados por programas y usuarios[cite: 1]. 
  * `/usr`: Aplicaciones secundarias, código fuente, manuales y utilidades de nivel de usuario[cite: 1, 2]. 
  * `/var`: Datos variables y dinámicos (registros de log en `/var/log`, colas de impresión, bases de datos)[cite: 1, 2]. 

### c. Sistemas de archivos soportados:
* **Nativos de Linux:** `ext2`, `ext3`, `ext4`, `XFS`, `Btrfs`, `ReiserFS`[cite: 1, 2]. 
* **Compatibles / Otros:** `FAT32` (`vfat`), `NTFS`, `exFAT`, `ISO 9660`, `NFS`[cite: 2].

---

## 7. Particiones

### a. Definición, tipos, ventajas y desventajas:
* **Definición:** Forma de dividir el disco físico de manera lógica[cite: 2]. 
* **Tipos de particiones:**
  * **Primaria:** División básica directa del disco (máximo **4 por disco**)[cite: 2].
  * **Extendida:** Partición primaria especial que actúa como contenedor para alojar particiones lógicas[cite: 2].
  * **Lógica:** Particiones creadas dentro del espacio de la partición extendida para superar el límite de 4[cite: 2].
* **Ventajas:** Permite aislar el SO de los datos personales, facilita las tareas de respaldo (**backup**) y da soporte de **arranque múltiple**[cite: 2, 3].
* **Desventajas:** Desperdicio o **fragmentación estática** de espacio si se dimensionan de forma inadecuada durante la instalación[cite: 2].

### b. ¿Cómo se identifican las particiones en GNU/Linux? (Discos IDE, SCSI, SATA):
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

### e. ¿Es posible visualizar particiones FAT y NTFS en GNU/Linux?
**Sí, es posible.** Cada partición se puede formatear con sistemas destino compatibles como FAT o NTFS[cite: 2, 3]. GNU/Linux puede reconocer y montar particiones de Windows conviviendo en el mismo disco (ej. `/dev/hda1: DOS con Windows`)[cite: 2, 3].

### f. Tipos de software para particionar:
* **Destructivos:** Solo permiten crear y eliminar particiones (ejemplo: `fdisk`)[cite: 2, 3].  
* **No destructivos:** Permiten crear, eliminar y además **modificar/redimensionar** particiones existentes sin perder datos (ejemplos: `fips`, `gparted`)[cite: 2, 3].

---

## 8. Arranque (bootstrap) de un Sistema Operativo

### a. ¿Qué es el BIOS? ¿Qué tarea realiza?
El **BIOS** (*Basic I/O System*) es el software grabado en un chip de memoria no volátil (**ROM/NVRAM**) encargado de iniciar el hardware y la carga del SO a través del **MBC** (su última acción es leer y ejecutar el código del MBC alojado en el MBR)[cite: 2, 3].

### b. ¿Qué es UEFI? ¿Cuál es su función?
**UEFI** (*Unified Extensible Firmware Interface*) es un estándar moderno de comunicación entre el sistema operativo y el firmware de la máquina[cite: 3]. Define la ubicación del gestor de arranque, expone información de hardware al *bootloader* y provee un **BootManager** capaz de cargar aplicaciones y drivers desde sistemas de archivos directos como FAT32[cite: 3].

### c. ¿Qué es el MBR? ¿Qué es el MBC?
* **MBR (Master Boot Record):** Primer sector del disco físico (cilindro 0, cabeza 0, sector 1; tamaño de 512 bytes) donde se almacena el código de arranque y la tabla de particiones[cite: 2].
* **MBC (Master Boot Code):** Pequeño programa de código de booteo ubicado en los primeros **446 bytes** del MBR cuya función es lanzar el gestor de arranque principal[cite: 2, 3].

### d. ¿A qué hacen referencia las siglas GPT? ¿Qué sustituye? Formato:
* **GPT (GUID Partition Table):** Sistema de particionado vinculado a la interfaz **UEFI**[cite: 2, 3].
* **Sustitución:** Sustituye al esquema tradicional de particiones del **MBR**, superando el límite de 4 particiones primarias y la restricción de discos de 2 TB[cite: 2, 3].
* **Formato:** Utiliza direccionamiento por bloques lógicos (**LBA** - *Logical Block Addressing*) en vez del esquema Cilindro-Cabeza-Sector (CHS)[cite: 2]. Mantiene un *protective MBR* en el **LBA 0** por compatibilidad y ubica la cabecera GPT a partir de **LBA 1**[cite: 2].

### e. ¿Cuál es la funcionalidad de un “Gestor de Arranque”? Tipos, instalación y ejemplos:
* **Funcionalidad:** Cargar la imagen del Kernel del sistema operativo desde el disco a la memoria RAM para cederle el control de la CPU[cite: 3].
* **Ubicación/Instalación:** Se instala principalmente de dos modos:
  1. Directamente en el **MBR** (o el espacio contiguo *MBR gap*)[cite: 3].
  2. En el sector de arranque de una partición específica (**VBR** / *Volume Boot Record*)[cite: 3].
* **Gestores conocidos:** `GRUB`, `LILO`, `NTLDR`, `GAG`, `YaST`[cite: 3].
## <font color="#00b0f0"> f. ¿Cuáles son los pasos que se suceden desde que se prende una computadora hasta que el Sistema Operativo es cargado (proceso de bootstrap)?</font>
1. Se empieza a ejecutar el código del **BIOS**.
2. El BIOS ejecuta el **POST** (*Power-On Self-Test*).
3. El BIOS lee el sector de arranque (**MBR**).
4. Se carga el gestor de arranque a través del **MBC** (*Master Boot Code*).
5. El **bootloader** (ej. GRUB) carga el **Kernel** y el **initrd** (*initial ram disk*).
6. Se monta el **initrd** como sistema de archivos raíz temporal y se inicializan componentes esenciales del núcleo (como el *scheduler*).
7. El Kernel ejecuta el proceso **init** (PID 1) y se desmonta el **initrd**.
8. Se lee el archivo de configuración **/etc/inittab**.
9. Se ejecutan los scripts asociados al **runlevel 1**.
10. El final del runlevel 1 indica la transición hacia el **runlevel por defecto**.
11. Se ejecutan los scripts apuntados por el **runlevel por defecto**.
12. El sistema queda listo para ser usado (presentando la pantalla de *login*).

---

## <font color="#00b0f0">g. Analice el proceso de arranque en GNU/Linux y describa sus principales pasos.</font>
* **Arranque por BIOS clásico:** El gestor de arranque (comúnmente **GRUB**) opera por fases encadenadas; la **Fase 1** en el MBR invoca a la **Fase 1.5** (en el *MBR gap*), y esta carga la **Fase 2**, encargada de presentar la interfaz de selección y cargar la imagen del Kernel en memoria.
* **Arranque por UEFI:** **GRUB** se ejecuta de manera directa como una aplicación UEFI almacenada en una partición con formato FAT32, prescindiendo del esquema por etapas intermedias.
* **Inicialización del Kernel:** El Kernel toma el control, analiza el hardware, monta el entorno temporal para cargar controladores críticos y cede el mando al primer proceso del espacio de usuario (**init** o **systemd**).

---

**h. ¿Cuáles son los pasos que se suceden en el proceso de parada (shutdown) de GNU/Linux?**
1. El sistema envía una **señal de terminación** (`SIGTERM` / `SIGKILL`) a todos los procesos activos para cerrarlos ordenadamente.
2. Se sincronizan los búferes de disco y se **desmontan de forma segura los sistemas de archivos** (remontándolos en modo de solo lectura para evitar daños o corrupción).
3. Se envía la **señal de corte de energía** (*poweroff*) al hardware o se detiene la CPU de manera definitiva.

---

**i. ¿Es posible tener en una PC GNU/Linux y otro Sistema Operativo instalado? Justifique.**  
**Sí, es totalmente posible.**  
* **Particionado independiente:** La arquitectura permite alojar cada sistema operativo en particiones lógicas o primarias separadas dentro del mismo disco físico.
* **Gestor de arranque múltiple:** Se utiliza un gestor como **GRUB** (*GRand Unified Bootloader*) para seleccionar dinámicamente qué sistema operativo iniciar en cada arranque[cite: 1, 8].
* **Consideración de instalación:** Si el instalador de un sistema operativo no detecta el SO previo y sobrescribe el sector de arranque primario, puede dejarlo temporalmente inaccesible hasta que se reconfigure el gestor de booteo[cite: 1, 8].

---

## 9. Archivos y Editores

**a. ¿Cómo se identifican los archivos en GNU/Linux?**  
En GNU/Linux los archivos se identifican internamente por su **número de inodo** (*inode*) y su **ruta dentro del árbol jerárquico de directorios**. A diferencia de otros sistemas como Windows, las extensiones (como `.txt` o `.exe`) son meramente descriptivas u opcionales y no determinan el tipo real ni los privilegios de ejecución del archivo.

---

**b. Investigue el funcionamiento de los editores vim, nano y mcedit, y los comandos cat, more y less.**

* **Editores de texto:**
  * **vim:** Editor de consola avanzado basado en modos (**modo comando**, **modo inserción** y **modo visual**), operado completamente mediante comandos de teclado.
  * **nano:** Editor interactivo sencillo y directo, orientado a principiantes, con una barra de atajos visibles al pie de pantalla.
  * **mcedit:** Editor provisto por el entorno *Midnight Commander*, visualmente semejante a los editores clásicos de DOS, amigable para modificaciones rápidas.

* **Comandos de visualización:**
  * **`cat`:** Concatena y muestra todo el contenido de un archivo directamente en la terminal sin realizar pausas.
  * **`more`:** Paginador interactivo que muestra el contenido pantalla por pantalla permitiendo únicamente avanzar en el texto.
  * **`less`:** Paginador avanzado que permite desplazarse libremente hacia adelante y hacia atrás mediante atajos de navegación y búsquedas.

---

**c. Cree un archivo llamado “prueba.exe” en su directorio personal usando vim (debe contener su número de alumno y su nombre).**
1. Abrir la terminal y ejecutar:
   {```bash
   vim ~/prueba.exe
   } 
2. ## 9. Archivos, Editores y Comandos de Archivos

**¿Cómo funciona el comando file y qué diferencia se observa al probarlo con "prueba.exe"?**
* **Funcionamiento:** Determina el tipo real de un archivo examinando su estructura interna y números mágicos (*magic numbers*), sin basarse en la extensión que posea.
* **Diferencia:** Al ejecutarlo sobre `prueba.exe`, indica que es un archivo de texto plano ASCII (`ASCII text`), demostrando que la extensión `.exe` no lo convierte en un ejecutable binario para el sistema operativo.

---

**Investigue la funcionalidad y parámetros de los siguientes comandos relacionados con el uso de archivos:**
* **`cd`:** Cambia el directorio de trabajo actual.
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

---

**Comandos necesarios para realizar cada una de las siguientes acciones:**
* **Crear la carpeta ISOCSO:**  
  `mkdir ISOCSO`[cite: 1, 3]
* **Acceder a la carpeta:**  
  `cd ISOCSO`[cite: 1, 3]
* **Crear dos archivos con los nombres isocso.txt e isocso.csv:**  
  `touch isocso.txt isocso.csv`[cite: 3]
* **Listar el contenido del directorio actual:**  
  `ls -l`[cite: 1, 3]
* **Visualizar la ruta donde estoy situado:**  
  `pwd`[cite: 1, 3]
* **Buscar todos los archivos en los que su nombre contiene la cadena “iso*”:**  
  `find . -name "iso*"`[cite: 1, 3]
* **Informar la cantidad de espacio libre en disco:**  
  `df -h`[cite: 1, 3]
* **Verificar los usuarios conectados al sistema:**  
  `who`[cite: 1, 3]
* **Editar el archivo isocso.txt e ingresar Nombre y Apellido:**  
  `nano isocso.txt` *(o `vim isocso.txt`)*[cite: 1]
* **Mostrar en pantalla las últimas líneas de un archivo:**  
  `tail isocso.txt`[cite: 1, 3]

---

## 10. Comandos del Sistema

| Comando | Objetivo | Parámetros Comunes | Ubicación (Directorio) |
| :--- | :--- | :--- | :--- |
| **`man`** | Muestra el manual de referencia de comandos y utilidades[cite: 1]. | `-k` (busca por palabra clave)[cite: 1]. | `/usr/bin/man`[cite: 1] |
| **`shutdown`** | Apaga o reinicia el equipo de forma planificada y segura[cite: 1]. | `-h` (apagar), `-r` (reiniciar), `now` (inmediato)[cite: 1]. | `/sbin/shutdown`[cite: 1] |
| **`reboot`** | Reinicia el sistema operativo de forma inmediata[cite: 1]. | `-f` (fuerza reinicio sin desmontar ordenadamente)[cite: 1]. | `/sbin/reboot`[cite: 1] |
| **`halt`** | Detiene todos los procesos y apaga la CPU[cite: 1]. | `-f` (fuerza la detención)[cite: 1]. | `/sbin/halt`[cite: 1] |
| **`uname`** | Muestra información del sistema y arquitectura[cite: 1]. | `-a` (toda la información), `-r` (versión del Kernel)[cite: 1]. | `/bin/uname`[cite: 1] |
| **`dmesg`** | Imprime los mensajes del búfer del Kernel[cite: 1]. | `-c` (limpia el búfer), `-T` (fechas legibles)[cite: 1]. | `/bin/dmesg`[cite: 1] |
| **`lspci`** | Lista los buses PCI y dispositivos conectados[cite: 1]. | `-v` (modo detallado), `-nn` (códigos numéricos)[cite: 1]. | `/sbin/lspci`[cite: 1] |
| **`at`** | Programa tareas para una única ejecución futura[cite: 1]. | `-l` (lista pendientes), `-r` (elimina tarea)[cite: 1]. | `/usr/bin/at`[cite: 1] |
| **`head`** | Muestra las primeras líneas de un archivo de texto[cite: 1]. | `-n [número]` (define la cantidad de líneas)[cite: 1]. | `/usr/bin/head`[cite: 1] |
| **`tail`** | Muestra las últimas líneas de un archivo de texto[cite: 1]. | `-n [número]`, `-f` (sigue cambios en tiempo real)[cite: 1]. | `/usr/bin/tail`[cite: 1] |

---

## 11. Proceso de Arranque SystemV

**a. Pasos del proceso de inicio desde el encendido hasta el login:**
1. Se empieza a ejecutar el código del BIOS/UEFI[cite: 1].
2. El BIOS ejecuta el POST para verificar componentes de hardware[cite: 1].
3. El BIOS lee el sector de arranque primario (MBR)[cite: 1].
4. Se carga el gestor de arranque mediante el MBC (*Master Boot Code*)[cite: 1].
5. El *bootloader* transfiere a la memoria RAM el Kernel y el *initrd*[cite: 1].
6. Se monta el *initrd* como sistema de archivos raíz temporal y se inicializan componentes esenciales[cite: 1].
7. El Kernel ejecuta el proceso `init` (PID 1) y desmonta el *initrd*[cite: 1].
8. El proceso `init` lee el archivo de configuración `/etc/inittab`[cite: 1].
9. Se ejecutan los scripts apuntados por el runlevel 1[cite: 1].
10. La finalización del runlevel 1 indica el pasaje al runlevel por defecto[cite: 1].
11. Se ejecutan los scripts del runlevel por defecto[cite: 1].
12. El sistema queda listo para operar y presenta el prompt de login[cite: 1].

---

**b. Proceso INIT: ¿Quién lo ejecuta? ¿Cuál es su objetivo?**
* **Ejecutor:** Es lanzado por el Kernel al finalizar su carga y la detección de hardware[cite: 1].
* **Objetivo:** Es el proceso padre de todos los demás procesos en el espacio de usuario (se le asigna el **PID 1**) y tiene como función cargar los subprocesos y demonios para que el sistema opere correctamente[cite: 1].

---

**c. RunLevels: ¿Qué son? ¿Cuál es su objetivo?**
* **Definición:** Son modos o estados de operación preconfigurados en el sistema operativo[cite: 1].
* **Objetivo:** Iniciar o detener un conjunto específico de servicios según las necesidades del equipo (modo monousuario, multiusuario en texto o gráfico)[cite: 1].

---

**d. Niveles de ejecución según el estándar, archivo de definición y soporte entre distribuciones:**
* **Niveles estándar:**
  * `0`: *Halt* (parada o apagado total)[cite: 1].
  * `1` / `S`: *Single-user mode* (modo monousuario de mantenimiento)[cite: 1].
  * `2`: Modo multiusuario sin soporte de red[cite: 1].
  * `3`: Modo multiusuario en consola con red[cite: 1].
  * `4`: No utilizado / reservado para personalizaciones[cite: 1].
  * `5`: Modo multiusuario con entorno gráfico (*X11*)[cite: 1].
  * `6`: *Reboot* (reinicio)[cite: 1].
* **Definición de inicio:** Se define mediante la directiva `initdefault` dentro del archivo `/etc/inittab`[cite: 1].
* **Respeto del estándar:** No todas las distribuciones lo respetan de forma idéntica; distribuciones basadas en Debian utilizan los niveles del 2 al 5 indistintamente, mientras que familias como Red Hat los diferenciaban estrictamente[cite: 1].

---

**e. Archivo /etc/inittab: Finalidad, información y estructura:**
* **Finalidad:** Dictar las directivas e instrucciones principales al proceso `init`[cite: 1].
* **Información almacenada:** Define el runlevel por defecto y las acciones o scripts a ejecutar durante transiciones de estado[cite: 1].
* **Estructura:** Sus campos están delimitados por dos puntos (`:`):  
  `id:runlevel:accion:proceso`  
  *(Ejemplo: `id:5:initdefault:`)*[cite: 1].

---

**f. Cambio de runlevel: Comando y permanencia:**
* **Comando:** Ejecutar como superusuario `init <Y>` (o `telinit <Y>`)[cite: 1].
* **Permanencia:** No es permanente[cite: 1]. Solo se mantiene durante la sesión en curso; al reiniciar la máquina, el sistema volverá a cargar el nivel configurado en `/etc/inittab`[cite: 1].

---

**g. Scripts RC: Finalidad, almacenamiento y orden de ejecución:**
* **Finalidad:** Iniciar (*start*) o detener (*stop*) los servicios y demonios del sistema operativo[cite: 1].
* **Almacenamiento:** Residen físicamente en `/etc/init.d/`, y se asocian mediante enlaces simbólicos dentro de directorios específicos para cada nivel (ej. `/etc/rc5.d/`)[cite: 1].
* **Determinación de acción:** Los scripts que inician con **`S`** (*Start*) se ejecutan para levantar el servicio, y los que inician con **`K`** (*Kill*) se ejecutan para detenerlo[cite: 1].
* **Orden de ejecución:** Se guían por un número de orden inmediato a la letra (ejemplo: `S20apache` arranca antes que `S99local`), garantizando que se respeten las dependencias entre servicios[cite: 1].

---

## 12. SystemD

**a. ¿Qué es systemd?**  
Es el administrador de sistema y gestor de servicios moderno en distribuciones GNU/Linux[cite: 1]. Se ejecuta como el primer proceso en espacio de usuario (**PID 1**) centralizando la administración de demonios, procesos y dependencias[cite: 1].

---

**b. ¿A qué hace referencia el concepto de Unit en SystemD?**  
Una **Unit** (unidad) es el objeto fundamental de trabajo y configuración que administra SystemD[cite: 1]. Representa un recurso del sistema y se define en ficheros con extensiones como `.service`, `.socket`, `.mount` o `.target`[cite: 1].

---

**c. ¿Para qué sirve el comando systemctl en SystemD?**  
Es la herramienta de control por línea de comandos para consultar y administrar el estado del sistema y sus *units*[cite: 1]. Permite iniciar (`start`), detener (`stop`), reiniciar (`restart`), habilitar en el arranque (`enable`), deshabilitar (`disable`) y comprobar el estado (`status`) de los servicios.

---

**d. ¿A qué hace referencia el concepto de target en SystemD?**  
Un **target** es una unidad especial (`.target`) que agrupa varias unidades para establecer puntos de sincronización durante el inicio del equipo[cite: 1]. Cumple la función equivalente a los *Runlevels* clásicos de SystemV (por ejemplo, `multi-user.target` reemplaza al nivel 3 y `graphical.target` al nivel 5)[cite: 1].

---

**e. ¿Qué se observa a partir de la ejecución del comando pstree?**  
Muestra todos los procesos activos organizados en forma de **árbol jerárquico** de dependencias, donde se visualiza claramente que la raíz principal del sistema es `systemd` (o `init`)[cite: 1, 3].

---

## 13. Usuarios

**a. ¿Qué archivos son utilizados en GNU/Linux para guardar la información de usuarios?**
* **`/etc/passwd`:** Almacena los datos principales de las cuentas (nombre de usuario, UID, GID primario, comentario, ruta del directorio home y shell predeterminada)[cite: 1].
* **`/etc/shadow`:** Almacena de forma segura y cifrada las contraseñas de los usuarios y las políticas de expiración[cite: 1].
* **`/etc/group`:** Almacena la definición de los grupos del sistema y sus miembros asociados[cite: 1].

---

**b. ¿A qué hacen referencia las siglas UID y GID? ¿Pueden coexistir UIDs iguales?**
* **UID (*User Identifier*):** Identificador numérico único asignado a cada usuario para gestionar permisos y accesos[cite: 1].
* **GID (*Group Identifier*):** Identificador numérico asignado a cada grupo para la gestión colectiva de privilegios[cite: 1].
* **Coexistencia de UIDs:** Sí, técnicamente pueden coexistir si se configuran de forma manual en `/etc/passwd`[cite: 1]. Sin embargo, representa una mala práctica de seguridad porque para el Kernel ambos nombres compartirán exactamente los mismos permisos y privilegios sobre los recursos[cite: 1].

---

**c. ¿Qué es el usuario root? ¿Puede existir más de un usuario con este perfil? ¿Cuál es su UID?**
* **Definición:** Es el superusuario y administrador global con privilegios absolutos sobre el sistema operativo[cite: 1].
* **UID:** Su identificador numérico siempre es **`0`**[cite: 1].
* **Múltiples perfiles:** Sí, es posible crear otra cuenta con facultades totales asignándole manualmente el **UID 0** en el archivo `/etc/passwd`[cite: 1].

---

**d. Ejercicio práctico (creación, asignación, archivo y eliminación):**

1. Crear el grupo `informatica`:
   {```bash
   sudo groupadd informatica}
   2. Agregue un nuevo usuario llamado *isocso* a su instalación de GNU/Linux, especifique que su home sea creada en /home/*isocso*, y hágalo miembro del grupo *informatica* (si no existe, deberá crearlo). Luego, sin iniciar sesión como este usuario cree un archivo en su home personal que le pertenezca. Luego de todo esto, borre el usuario y verifique que no queden registros de él en los archivos de información de los usuarios y grupos.  

   3. Investigue la funcionalidad y parámetros de los siguientes comandos:
       useradd: añadir un usuario, modifica $cat/etc/passwd
       adduser: crear cuentas de usuario. -m direc home, -d <ruta> def home, -g <grupo> asigna gp primario, -s <shell> def shell x defecto
       groupadd: crea nuevo grupo en el sistema. -g <GID> asigna id, -r crea gp del sist.
       usermod: mod prop de una cuenta de usuario existente
       who: muestra info sobre users con sesion activa en sist.
       userdel: elimina cuenta de usuario del sist. -r ademas borra home y correo, -f elimina hasta con sesion iniciada
       groupdel: elimina gp existente.
       su: permite alternal la sesion hacia otro usuario o super
       passwd: permite cambiar la contra de un usuario.


 

4. FileSystem y permisos:  

   5. ¿Cómo son definidos los permisos sobre archivos en un sistema GNU/Linux?  
       Permisos de usuarios:
       u: El usuario duenio del archivo.
       g: El grupo asignado al archivo.
       o: El resto de los usuarios del sistema.
       Permisos basicos:
       r: read permite ver contenido archivo. Valor 4 octal.
       w: write permite mod o eliminar archivo. Valor 2 octal.
       x: permite ejecutar archivo si es un script/programa. Valor 1 octal.
   6. Investigue la funcionalidad y parámetros de los siguientes comandos relacionados con los permisos en GNU/Linux:
       chmod: cambia permisos de acceso de un directorio.
       chown: cambia el uuario propietario de un directorio.
       chgrp: cambia el grupo asignado a un directorio.

   7. Al utilizar el comando chmod generalmente se utiliza una notación octal asociada para definir permisos. ¿Qué significa esto? ¿A qué hace referencia cada valor?
       el modo octal sirve para definir proceso numericamente de 3 digitos, cada valor tiene asignado una accion y se puede sumar para obtener un digito del 0 al 7 que def combinacion de accesos.

   8. ¿Existe la posibilidad de que algún usuario del sistema pueda acceder a determinado archivo para el cual no posee permisos? Indiquelo y realice las pruebas correspondientes. 
       el superusuario puede acceder a cualquier archivo del sistema. Los demas solo a los que posean permisos.

   9. Explique los conceptos de “full path name” (path absoluto) y “relative path name” (path relativo). De ejemplos claros de cada uno de ellos.  
       Full path name = ubicacion exacta de un archivo o directorio desde la raiz. es unica e invariable.
       relative path name = ruta especifica de un elemento partiendo de la ubi actual de trabajo. 
   10. ¿Con qué comando puede determinar en qué directorio se encuentra actualmente? ¿Existe alguna forma de ingresar a su directorio personal sin necesidad de escribir todo el path completo? ¿Podría utilizar la misma idea para acceder a otros directorios? ¿Cómo? Explique con un ejemplo.
       Con pwd informa el dir actual. Cd para ingresar al dir perso solo sin args.
       `~` (para subdirectorios del home), `.` (directorio actual) o `..` (directorio superior/padre) sin necesidad de escribir la ruta absoluta completa desde `/`.
   11. Investigue la funcionalidad y parámetros de los siguientes comandos relacionados con el uso del FileSystem:
       umount: desmonta sistema de archivos o disp montado en arbol de dir
       du: muestra espacio ocupado en disco por arch y dir
       df: muestra info del espacio libre y ocupado en particiones y sist mont
       mount: monta un disp de almacenamiento en un punto del arbol o lista los disp montados actualmente.
       mkfs: da formato a una particion creando un sist de archivos sobre ella.
       fdisk (con cuidado): herramienta par ver, crear y eliminar tabla de particiones
       write: envia mensajes de texo a la terminal de otro usuario conectado en la pc.
       losetup: asocia o desacopla archivos regulares con disp de bucle.
       stat: muestra el estado y metadatos de un filesystem.
 

12. Procesos:  

    1. ¿Qué significa que un proceso se está ejecutando en Background? ¿Y en Foreground?
       Foreground(primer plano): se ejecuta en la terminal directamente tomando el control bloqueando la linea de comandos hasta que el proceso termine.
       Background(segundo plano): el proceso se ejecuta independientemente de la interac del usuario y no bloquea la terminal.
    2. ¿Cómo puedo hacer para ejecutar un proceso en Background? ¿Como puedo hacer para pasar un proceso de background a foreground y viceversa?
       &: background al final ara ejecutar en background.
       Corriendo un proceso en primer plano, Ctrl + z suspende y bg reanuda en background. y si quiero de vueltr foregound fg.
       
    3. Pipe ( **|** ). ¿Cuál es su finalidad? Cite ejemplos de su utilización.
       Lo que hace es unir procesos permitiendo encadenar y procesar datos sin crear arch tmp. 
    4. Redirección. ¿Qué tipo de redirecciones existen? ¿Cuál es su finalidad? Cite ejemplos de utilización.
       Permite cambiar el origen de la entrada o el destino de las salidas de un comando, conectándolos directamente con archivos en vez de usar el teclado o la pantalla.
       Tipos: 
        Entrada ("< solo el de la izq>"): Lee datos desde un archivo como entrada estándar (_stdin_).
        Salida estándar sobrescribiendo (`>`): Envía la salida estándar (_stdout_) hacia un archivo, creándolo o sobrescribiéndolo si ya existía.
        Salida estándar concatenando (`>>`): Anexa la salida estándar al final del archivo sin borrar su contenido previo.
        Salida de error (`2>` o `2>>`): Desvía los mensajes de error (_stderr_) a un archivo para no mostrarlos por la terminal.
_Ejemplo:_
28. Otros comandos de Linux (Indique funcionalidad y parámetros):  

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

         

9. Indique qué comando/s es necesario para realizar cada una de las acciones de la siguiente secuencia de pasos (considerando su orden de aparición):  

    1. Cree un directorio llamado *logs* en el directorio /tmp.  

    2. Copie todo el contenido del directorio /var/log en el directorio creado en el punto anterior.  

    3. Empaquete el directorio creado en a), el archivo resultante se debe llamar "misLogs.tar".  

    4. Empaquete y comprima el directorio creado en a), el archivo resultante se debe llamar "misLogs.tar.gz".  

    5. Copie los archivos creados en c) y d) al directorio de trabajo de su usuario.  

    6. Elimine el directorio creado en a), *logs*.  

    7. Desempaquete los archivos creados en c y d en 2 directorios diferentes. 

 

 

 de 10 

[image1]: <data:image/png;base64,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>
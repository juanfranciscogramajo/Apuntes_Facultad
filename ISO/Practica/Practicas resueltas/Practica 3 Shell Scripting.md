Ejercicio 0

Repase el objetivo y parámetros principales de los siguientes comandos vistos en

el Trabajo Práctico N° 1 y que serán necesarios para resolución de los siguientes

ejercicios:

echo, pwd, mkdir, chmod, ls, who, mv, rm, touch, grep, wc

|Comando|Objetivo|Parámetros principales|Ejemplo práctico|
|---|---|---|---|
|**`echo`**|Imprime texto o el valor de variables por salida estándar.<br><br>5 - Shell Scripting.pdf|`-n` (no agrega salto de línea al final), `-e` (interpreta secuencias de escape como `\n` o `\t`).|`echo "Hola $USER"`<br><br>5 - Shell Scripting.pdf|
|**`pwd`**|Muestra la ruta absoluta del directorio de trabajo actual (_Print Working Directory_).|`-P` (muestra la ruta física real resolviendo enlaces simbólicos), `-L` (muestra la ruta lógica).|`pwd` → `/home/alumno`|
|**`mkdir`**|Crea uno o más directorios nuevos.<br><br>2 - Linux Cont (1).pdf|`-p` (crea directorios padres intermedios si no existen y no da error si ya existe), `-m` (asigna permisos al crear).|`mkdir -p tp2/scripts`|
|**`chmod`**|Modifica los permisos de acceso (lectura `r=4`, escritura `w=2`, ejecución `x=1`) de archivos o directorios.<br><br>2 - Linux Cont (1).pdf|Modo octal (`755`, `640`) o simbólico (`+x`, `u+w`, `go-r`), `-R` (aplica cambios recursivamente).|`chmod 755 script.sh`<br><br>2 - Linux Cont (1).pdf|
|**`ls`**|Lista el contenido de archivos y directorios.<br><br>2 - Linux Cont (1).pdf|`-l` (formato largo con permisos, dueño y tamaño), `-a` (incluye archivos ocultos que empiezan con `.`), `-h` (tamaños legibles como KB/MB), `-R` (recursivo).|`ls -la /tmp`|
|**`who`**|Muestra qué usuarios tienen una sesión abierta actualmente en el sistema.|`-u` (muestra tiempo de inactividad y PID), `-q` (muestra solo nombres y cantidad total de usuarios), `-H` (imprime encabezados).|`who`|
|**`mv`**|Mueve archivos/directorios de ubicación o los renombra.<br><br>2 - Linux Cont (1).pdf|`-i` (pide confirmación antes de sobrescribir), `-f` (sobrescribe sin preguntar), `-n` (no sobrescribe archivos existentes).|`mv viejo.txt nuevo.txt`|
|**`rm`**|Elimina archivos o directorios del sistema de archivos.<br><br>2 - Linux Cont (1).pdf|`-r` o `-R` (elimina directorios y su contenido recursivamente), `-f` (fuerza el borrado sin pedir confirmación), `-i` (pide confirmación).|`rm -rf carpeta_temp/`|
|**`touch`**|Crea un archivo vacío si no existe, o actualiza su fecha y hora de última modificación si ya existe.|`-a` (cambia solo fecha de acceso), `-m` (cambia solo fecha de modificación), `-t` (establece una marca de tiempo específica).|`touch ejercicio1.sh`|
|**`grep`**|Busca líneas que coincidan con un patrón de texto dentro de archivos o desde la entrada estándar.<br><br>5 - Shell Scripting.pdf|`-i` (ignora mayúsculas/minúsculas), `-v` (invierte la búsqueda: muestra líneas que _no_ coinciden), `-r` (busca recursivamente en directorios), `-n` (muestra el número de línea).|`grep -i "pepe" /tmp/*`<br><br>5 - Shell Scripting.pdf|
|**`wc`**|Cuenta líneas, palabras y bytes/caracteres de un archivo o de la entrada estándar (_Word Count_).<br><br>5 - Shell Scripting.pdf|`-l` (cuenta solo líneas), `-w` (cuenta solo palabras), `-c` (cuenta bytes), `-m` (cuenta caracteres).<br><br>5 - Shell Scripting.pdf|`ls|
1. **¿Qué es el Shell Scripting?** 
   Es la programación de archivos de texto (_scripts_) que agrupan una serie de comandos e instrucciones utilizando las estructuras de control (como `if`, `while`, `for`, `case`) que provee una _shell_ (intérprete de comandos en sistemas tipo Unix).
- **¿A qué tipos de tareas están orientados?**
    - **Automatización de tareas:** son muy prácticos para manipular archivos, crear procesos y gestionar sus entradas/salidas.
    - **Aplicaciones interactivas** por consola.
    - **Aplicaciones con interfaz gráfica** sencilla (mediante comandos como `zenity`).
- **¿Los scripts deben compilarse? ¿Por qué?** 
  No. A diferencia de lenguajes como C o Java, los scripts son **interpretados**: la _shell_ (por ejemplo, `bash`) lee el archivo línea por línea y ejecuta cada instrucción directamente. Por esto mismo se indica la ruta del intérprete en la primera línea mediante el _shebang_ (`#!/bin/bash`).
2. Investigar la funcionalidad de los comandos echo y read.
   **`echo`:** Imprime cadenas de texto o el valor de variables por la salida estándar (`stdout`, por defecto la pantalla).
   **`read`:** Lee una línea de texto desde la entrada estándar (`stdin`, por defecto el teclado) y almacena el contenido en una variable.
   a. ¿Cómo se indican los comentarios dentro de un script?
   Se indican utilizando el carácter **`#`**. Todo lo que se escriba a la derecha del `#` hasta el final de esa línea será ignorado por el intérprete _(la única excepción es `#!` en la primera línea, que define el shebang)_.
   b. ¿Cómo se declaran y se hace referencia a variables dentro de un script?
   Se escribe el nombre de la variable (sensible a mayúsculas/minúsculas; puede contener letras, números y `_`, pero **no** empezar con número) seguido de **`=`** y su valor, **sin espacios alrededor del `=`**. EJ facultad=Informatica o carrera_1="Licenciatura en Sistemas" # Se usan comillas si hay espacios.
   Se antepone el símbolo **`$`** al nombre de la variable y se usan llaves **`${variable}`** para delimitar el nombre y evitar ambigüedades al concatenar texto
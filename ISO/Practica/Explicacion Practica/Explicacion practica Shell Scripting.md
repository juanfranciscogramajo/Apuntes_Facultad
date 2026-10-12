## Introduccion:
**Shell:** Interprete de comandos, provee estructuras de control que permiten programar shell scripts. Ej shell: sh(defecto unix), Bash (+ usada), dash(eficiente compatible parcialmente con bash), csh(incompatible con bash/dash).
**Shell Script:** automatizaciones, tareas, es simple, practico para manejar archivos, funciona en cualquier SO de tipo GNU/linux, mac os x. 
- Instrucciones: comandos 
  - Internos o built-in (help para verlos) 
  - Externos (archivos separados man comando) 
- Redirecciones y pipes 
- Comentarios que empiezan con # 
- Estructuras de control 
  - if 
  - while 
  - for (2 tipos) 
  - case 
- Variables 
  - Strings 
  - Arreglos () 
- Funciones
## Comandos:
- Imprimir el contenido de un archivo cat archivo 
- Imprimir texto echo "Hola mundo" 
- Leer una línea desde entrada estándar en la variable var read var 
- Quedarme con la primer columna de un texto separado por : desde entrada estándar cut -d: -f1  
- Contar la cantidad de líneas que se leen desde entrada estándar wc -l
- Buscar todos los archivos que contengan la cadena pepe en el directorio /tmp grep pepe /tmp/* 
- Buscar todos los archivos dentro del home del usuario, cuyo nombre termine en .doc find $HOME -name "*.doc" 
- Buscar todos los archivos dentro del directorio actual que sean enlaces simbólicos find . -type l
- Empaquetado: Se unen varios archivos en uno solo (tar) 
  tar -cvf archivo.tar archivo1 archivo2 archivo3
  tar -xvf archivo.tar 
- Compresión: Se reduce el tamaño de un archivo (gzip/bzip2/etc.) 
  gzip archivo.tar # Genera archivo.tar.gz comprimido 
  gzip -d archivo.tar.gz # Descomprime archivo.tar 
- El comando tar puede invocar a gzip por nosotros (argumento z): 
  tar -cvzf archivo.tar.gz arch1 arch2 arch3 
  tar -xvzf archivo.tar.gz
## Redirecciones:
- stdin: Entrada estándar, normalmente el teclado. File descriptor 0
- stdout: Salida estándar, normalmente el monitor. File descriptor 1
- stderr: Salida de error estándar, normalmente la salida estándar. File descriptor 2
- Redirección destructiva (>): 
  - Si archivo no existe, se crea. 
  - Si archivo existe, lo sobreescribe. 
- Redirección no destructiva (>>): 
  - Si archivo no existe, se crea. 
  - Si archivo existe, se le agrega al final.
- 2> y 2>> Redirigen la salida de error estándar. comando 2> arch
- < Hace que archivo sea la entrada de comando. En otras palabras cuando comando intente leer entrada del teclado, en realidad, va a leer el contenido de archivo. comando < arch.
- Pipes "|": Sintaxis básica: comando | comando2 | comando3 
  - Conectan la salida de un comando con la entrada de otro. 
  - Indispensables para hacer programas potentes en shell script. 
## Variables 
- Tipos: Strings, arrays.
- Case Sensitive.
- Para crear una variable: NOMBRE="pepe" # SIN espacios alrededor del = 
- Para accederla se usa $: echo $NOMBRE 
- Para evitar ambigüedades se pueden usar llaves: 
  **/# Esto no accede a $NOMBRE** 
  echo $NOMBREesto_no_es_parte_de_la_variable 
  /# Esto sí 
  echo ${NOMBRE}esto_no_es_parte_de_la_variable
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
--- 
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
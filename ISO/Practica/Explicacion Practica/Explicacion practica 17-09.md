Cargar proceso en memoria 
2e n-1 ultima dirección.
Forma de dividir la memoria = particionar.
**Particiones fijas:** todas las particiones son del mismo tamaño. Desventaja **fragmentación interna:** si guardo poco espacio en una direccion grande se desperdicia memoria, Fácil de implementar.
**fragmentacion externa:** espacio libre fuera de las particiones que no se puede usar y se desperdicia.
**Particiones variables/dinamica:** se ajusta al proceso que queremos guardar, dificil de gestionar para adaptar la particion al tamaño del proceso.
**mejor ajuste:** menor fragmentacion interna 
**peor ajuste:** elige la que mayor fragmentacion interna genera, para luego realizar compactación (une espacio libre para crear un nuevo espacio para el proceso a insertar) muy costoso.
**siguiente ajuste:** ve las direcciones como una lista y elige la siguiente a la ultima ocupada
Memory managment unit: parte cpu que se encarga de la administracion de mem **chequear** se encarga del mapear direcciones virtuales a fisica.
- Direccion logica: referencia una direccion fisica de memoria, se la debe traducir a funa direccion fisica, Cpu trabaja con estas, para acceder a mem se debe transformar a fisica. 
- Direccion Fisica: direccion real, con la que se accede a memoria
La memoria se div en porciones de igual tamaño **marcos/frames** (ESTAN EN MEM PPAL???)512 bytes gral
el espacio de direcciones de procesos se divide en porciones de igual tamaño **paginas**
**Tabla de paginas:** contiene un numero para indicar en que marco se encuentra la pagina. ???
saber traducir mem logica a fisica.

**segmentacion:** mejora de paginacion, tabla de segmentos ademas de tener la dir de inicio tiene la longitudo o limite. tamaño variable.
las direcciones logicas tienen dos partes, numero de segmento y un desplazamiento d dentro del segmento.


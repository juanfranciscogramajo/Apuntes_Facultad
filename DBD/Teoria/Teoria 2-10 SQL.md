DDL: lenguaje de estructura estatica que no se usa, se usa para crear o modificar una BD
- Create Database: crea una BD con el nombre que ponga a continuacion.
- Drop Database: borra BD deja de existir.
  Una vez creada la BD:
- CREATE TABLE nombre: crea una tabla
- ALTER TABLE nombre: modifica una tabla
- DROP TABLE: borra una tabla}
- ADD/DROP/ALTER COLUMN nombre: agrega columna
VARCHAR [] string con limite
TEXT texto sin limite de espacio 
NULL puede ser nulo
PRIMARY KEY () asigna clave primaria
UNIQUE INDEX () clave univoca.
### CONSULTAS: 
- SELECT lista de atributos: lo que se va a mostrar. * muestra todos los atributos del from, distinct elimina tuplas duplicadas, All aparece todas las tuplas. AS renombrar para cambiar atributo, se usa para acortar
  EJ: 
  ![[Pasted image 20261008235826.png]]
- FROM lista de tablas: tablas donde se obtiene la informacion. Tablas que tienen datos q me interesan. la coma separa como producto cartesiano/join. 
  - Producto Natural: se escribe como INNER JOIN .... ON (Condicion), es lo mismo es mas eficiente pero no importa.
    ![[Pasted image 20261009001742.png]]
- WHERE condicion: muestra segun una condicion 
  EJ: 
  ![[Pasted image 20261009000304.png]]
  
- Like , sirve para buscar cadenas ![[Pasted image 20261009003802.png]]
- ORDER BY atributo: ordena DESC ASC, siempre ascendente default, en where o from ![[Pasted image 20261009004815.png]]
- Union/Union all: union no pone repetidos, union all muestra todos, une las tuplas resultantes de dos subconjuntos
- Intersect = interseccion y Except/Minus = diferencia - 
- funciones de agregacion<![[Pasted image 20261009005552.png]]
- 
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
- SELECT lista de atributos: lo que se va a mostrar. * muestra todos los atributos del from, distinct elimina tuplas duplicadas, All aparece todas las tuplas
  EJ: 
  ![[Pasted image 20261008235826.png]]
- FROM lista de tablas: tablas donde se obtiene la informacion. Tablas que tienen datos q me interesan. la coma separa como producto cartesiano/join. 
  - Producto Natural: mostrar 
- WHERE condicion: muestra segun una condicion 
  EJ: 
  ![[Pasted image 20261009000304.png]]
  
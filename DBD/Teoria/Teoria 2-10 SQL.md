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
NULL puede ser nulo, nunca tuvo valor != 0 not null es decir alguna vez tuvo valor, puede 0 
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
- funciones de agregacion: van en el select(x ahora), no where, devuelve un solo valor, una sola funcion de agregacion en el select.![[Pasted image 20261009005552.png]]
  EJ:![[Pasted image 20261009010113.png]]
  Esta bien xq usa una subfuncion x decir x eso esta en el where
- GROUP BY: agrupar conjunto de tuplas por algun criterio ej: 
  ![[Pasted image 20261009010604.png]] ESTA ES EXCEPCION DEL SELECT
- CREATE VIEW: es como una rutina, es una vista que es como si fuese el nombre de una tabla/proceso.
  ![[Pasted image 20261009011309.png]] Renombra count para usar en select.
- HAVING: permite condicionar un grupo para ser mostrado o no. puede tener consultas de agregacion. ![[Pasted image 20261009183222.png]]
- Subconsultas anidadas: 
  - in: si un elemento pertenece a un conjunto, dev boolean.
  - some: permite medir valor de una tupla frente resultados de la subconsulta, con que alguno cumpla es verdadero. > < >= etc.
  - all: compara y si TODOS cumplen se vuelve true. 
  - EXIST: evalua si la subconsulta devuelve o no algo, si no es vacia true.
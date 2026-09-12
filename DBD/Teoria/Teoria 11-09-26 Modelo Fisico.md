Modelo fisico: 
conversion de entidades
conversion de relaciones
Normalizacion
restricciones
dependencias
normalizacion

Modelo fisico(relacional): la bd pasa a ser un conjunto de tablas, una fila/registro es una tupla, columna es un atributo y los valores para un atributo forman su dominio.
Entidades pasan a ser tablas.
seleccion clave primaria: si una ent tiene varios identificaores se opta por uno o def un id subrogado autoincremental. si eligen id naturales que sean simples y compactos. 
Conversión de relaciones a tablas:
esto depende de su cardinalidad.
	(N:N): la relacion siempre se convierte en una nueva tabla. Hereda como claves foráneas las claves primarias de las entidades que relaciona, además de los atributos propios de la relacion.
	(1:N) con cobertura total: no crea tabla, la clave primaria del lado 1 viaja clave foránea a la tabla del lado N.
	1:N cobertura parcial lado N: no se convierte en tabla y no mod análisis.
	1:N cobertura parcial lado 1: cuando la participación es opcional (0,1)
		opción 1: se pasa la FK a la tabla del N permitiendo val null si no hay relacion
		Opción 2: se crea tabla intermedia para la relacion (evita nulos, pero costo crea tabla).
	1:1: si una depende de la otra se pueden unificar en una tabla, unico caso que una entidad puede no tener tabla propia.
	Ternarias: Gral. relaciones N:N, se crea una tabla intermedia con FK con cp de las 3 entidades.
	Recursivas: como es una relacion consigo misma, para pasarla al físico se trata como las binarias. Para implementarlas se hace clave foránea en la misma tabla con valor nulo. Ej. empleado y jefe(es empleado tmb), en tabla empleado agregas un campo q es una clave foránea que apunta a la clave primaria de la misma tabla.
	![[Pasted image 20260911210713.png]]
Claves Foráneas(FK): atributo en una tabla que hace referencia a CP de otra para conectar ambas estructuras.
Integridad referencial: garantiza la inexistencia de tuplas huérfanas. si una tupla apunta a 
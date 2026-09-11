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
Conversion de relaciones a tablas:
esto depende de su cardinalidad.
	(N:N): la relacion simepre se convierte en una nueva tabla. Hereda como claves foraneas las claves primarias de las entidades que relaciona, ademas de los atributos propios de la relacion.
	(1:N) con cobertura total: no crea tabla, la clave primaria del lado 1 viaja clave foranea a la tabla del lado N.
	1:N cobertura parcial del lado 1: cuando la participacion es opcional (0,1)
		opcion 1: se pasa la FK a la tabla del N permitiendo val null si no hay relacion
		Opcion 2: se crea tabla intermedia para la relacion (evita nulos, pero costo crea tabla).
relacion

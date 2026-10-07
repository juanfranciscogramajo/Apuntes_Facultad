- Lenguajes de consulta: se usan para operar con la BD, altas bajas, mod.
- 2 tipos:
   - procedurales: define que hacer y como hacerlo, quequiere obtener y pasos necesarios para resolver el problema
   - no procedurales: solo solicitan lo que desean y dejan a la BD que haga el como.
 Algebra Relacional: lenguaje de consultas procedimental, operaciones de uno o dos relaciones(Tablas), generan una tabla intermedia resultado. Expresion basica que cuenta con una relacion de una BD y una relacion constante. Les expresiones a partir de sub expresiones.
- Operaciones unitarias: solo una relacion, seleccion, proyeccion, renombre
- Operaciones binarias: sobre 2 relaciones, producto cartesiano, union, diferencia
Operaciones : 
- Seleccion: dada una relacion, aplica en la relacion y devuelve toda las tuplas que cumplen con la condicion dada. Ej: ![[Pasted image 20261007175106.png]]
- Proyeccion: aplicarse sobre una tabla y solo muestra los atributos que declaremos, los demas los ignora. ![[Pasted image 20261007175728.png]]
- Producto cartesiano: junta cada elemento de un conjunto con los elementos de otro conjunto, 
  ![[Pasted image 20261007184640.png]]
- Renombre: sirve para cambiar de nombre una relacion para permitir que una tabla se compare consigo mismo.
  ![[Pasted image 20261007191200.png]]
- Union: une 2 conjuntos todas las tuplas + tuplas de la otra, pero debe ser con sentido, alguna equivalencia. U
- Diferencia: lo que no esta en ambos, deben tener mismo orden, estructura y cantidad de atributos. -
- Producto Natural: junta las filas de dos conjuntos que tengan sentido, deben tener un atributo en comun, clave primaria en una tabla y clave foranea, o puede CF en ambas. Solo si tienen atributo en comun, nombre y representa lo mismo. Uno y solo Uno. | x |
- Interseccion: mismo q interseccion matematica, u dada vuelta
- Asignacion: expresion asigna a una var temporal, para ahorrar espacio y mas facil
- Producto Tita: combinacion de 2 prod cartesiano y seleccion,
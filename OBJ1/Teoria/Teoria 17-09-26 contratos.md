- Contratos: forma de escribir requerimientos o comportamiento de un sistema.
- Pre condicion: suposiciones relevantes, que se asumen como validas antes de la ejecucion de a operacion.
- Post condiciones: describen el estado luego de que se ejecute la operacion. Modificacion de vaores, creacion o eliminacion, creacion o ruptura. Son declarativas?
- Contratos del analisis al diseño: diaframas de interaccion que muestran como los obj se comunican con el objetivo cumpla los requerimientos.
## Buenas practicas para asignar responsabilidades
- hacer: 
  - algo por si mismo
  - iniciar accion cob otros objetos
  - controlar actividades de otros obj
- Conocer:
  - conocer sus datos privados
  - conocer sus obj relacionados
La asignacion de responsabilidades sucede durante la creacion de diagramas de secuencias.
- Experto: Asignar responsabiidad al experto en informacion, para cumplir su responsabilidad puede requerir info que esta en otros expertos.
- Creador: Asignar a una clase B la responsabilidad de crear una instancia de la clase A, B a objetos A en forma exclusiva, B contiene obj A, B tiene datos para iniciar objetos A.
- Bajo acomplamiento: el acoplamiento es dependencia de un obj con otros, alto acoplamieno dificulta hacer cambios, es indispensable el bajo acoplamiento.
- alta cohesion: medida de la fuerza con la que se relacionan las responsabilidades de un objeto y la cantidad, clases mas faciles de mantener, entender y reutilizar. 
## Del Analisis al diseño

## Diagrama de secuencia
- un diagrama de secuencia por cada operacion relacionada al caso de uso. 
- Si es complejo se divide en varios diagramas.
- Usar el contrato de la operacion como punto de partida, como se relacionan los objetos para cumplir el obj.
- Tener en cuenta las buenar practicas mencionadas arriba.

**Construcción del Modelo de Dominio**

- Se deben identificar clases conceptuales usando vocabulario del dominio del problema, evitando inventar conceptos o incluir detalles irrelevantes.
    
- Para descubrir estas clases, es útil utilizar listas de categorías predefinidas o identificar las frases nominales en los requerimientos.
    
- Los atributos del modelo deben ser, preferiblemente, tipos de datos primitivos o simples, como `String`, números o variables temporales.
    
- Si un concepto fue pensado como atributo pero posee secciones separadas, operaciones propias, otros atributos o representa una cantidad con unidad, debe transformarse en una clase conceptual.
    
- Es un error utilizar un atributo como clave o identificador para relacionar clases (por ejemplo, tener un `idCliente` tipo `String` dentro de una cuenta); estas relaciones deben modelarse exclusivamente mediante asociaciones.
    

**Herencia y Polimorfismo**

- Cuando varias subclases comparten los mismos atributos (herencia de estructura), es un indicio de que estos deben factorizarse y ubicarse en la superclase para que todas los hereden sin repetirlos.
    
- El uso de condicionales (como múltiples sentencias `if`) para consultar el valor de un atributo (por ejemplo, el tipo de tarjeta) es una mala práctica; la solución orientada a objetos es descubrir nuevas clases y delegar los cálculos apoyándose en el polimorfismo.
    

**Transición al Diseño y Código**

- Pasar del análisis al diseño requiere crear diagramas de interacción y aplicar heurísticas para la asignación de responsabilidades, con el objetivo de mantener un bajo acoplamiento y una alta cohesión.
    
- Los diagramas de secuencia del diseño muestran las interacciones reales entre los objetos a partir de los eventos del sistema.
    
- En el código, se pueden utilizar Interfaces para declarar tipos de variables sin acoplarlas a una implementación específica.
    
- Las relaciones de multiplicidad (donde un objeto conoce a "muchos") se implementan utilizando colecciones, por lo que el objeto interactúa enviándole mensajes directamente a dicha colección.
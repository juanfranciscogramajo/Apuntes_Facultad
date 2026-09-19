**Qué es un Objeto?** Un objeto es una abstracción de una entidad del dominio del problema (ej. Cliente, Cuenta) o del espacio de la solución (ej. ventanas, archivos). Todo objeto se caracteriza por tener:

- **Identidad:** Lo distingue de cualquier otro objeto, independientemente de si sus propiedades son iguales.
    
- **Comportamiento:** Es el conjunto de mensajes que el objeto sabe responder.
    
- **Conocimiento (Estado Interno):** Sus propiedades básicas y los otros objetos que necesita conocer. Este estado es privado y se mantiene en sus **variables de instancia**.
    

## Clases vs. Instancias

- **Clases:** Son los "moldes" que describimos al diseñar o programar el sistema.
    
- **Instancias (Objetos):** Son las entidades reales que se crean dinámicamente en memoria durante la ejecución del programa mediante la palabra reservada `new`.
    
- Todas las instancias de una misma clase comparten la misma estructura interna (variables) y entienden los mismos mensajes ejecutando los mismos métodos.
    

**Relaciones y Formas de Conocimiento** Un objeto solo puede comunicarse con otros que conoce. Conoce a otro objeto cuando:

- Tiene una referencia en una **variable de instancia** (relación duradera).
    
- Le llega una referencia como **parámetro** (relación temporal).
    
- Lo instancia o lo crea él mismo.
    
- Lo obtiene enviándole mensajes a otros objetos que ya conoce.
    
- El objetivo de conocer a otro objeto es mantenerlo en el sistema o **delegarle responsabilidades** (enviarle mensajes).
    

## Comportamiento y Envío de Mensajes

- **Mensajes vs. Métodos:** En este paradigma no invocamos funciones, sino que enviamos mensajes. El mensaje le dice al objeto _qué_ debe hacer, y el objeto receptor ejecuta un _método_ (la implementación) que define _cómo_ hacerlo.
    
- **Binding Dinámico:** Es la técnica que permite buscar qué método ejecutar en tiempo de ejecución basándose en la clase del objeto que recibe el mensaje. Esto permite desacoplar la invocación de la implementación.
    

## Principios de Diseño OO

- **Encapsulamiento:** Implica agrupar en un mismo módulo (el objeto) los datos y el comportamiento que opera sobre esos datos, asegurando una alta cohesión.
    
- **Ocultamiento de información:** Consiste en proteger las decisiones de diseño (estructuras internas, algoritmos) detrás de interfaces públicas estables para lograr un bajo acoplamiento. Solo se debe acceder al estado de un objeto a través de sus operaciones.
    
- **Inicialización:** Para que un objeto esté listo para recibir mensajes, es obligatorio inicializarlo utilizando **constructores** (asignando valores o instanciando colecciones).

- **Acoplamiento:**  Gradod de dependencia entre clases. (Lo mas bajo posibl)
- **Cohesion:** Grado en que los elementos estan relacionados entre si (altomejor) 
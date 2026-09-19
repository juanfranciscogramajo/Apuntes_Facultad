**Relaciones entre objetos y Colecciones**

- Un objeto conoce a otro ya sea para mantenerlo en el sistema de forma duradera (mediante variables de instancia) o para delegarle trabajo de forma temporal (recibiéndolo como parámetro o instanciándolo).
- Es un error utilizar identificadores (como IDs numéricos) para vincular objetos; en la orientación a objetos, las variables son punteros que referencian directamente a los objetos.
- Cuando un objeto necesita conocer a "muchos" de otro tipo, se debe implementar utilizando una colección (como un `ArrayList`). Para gestionar esta multiplicidad, se le envían mensajes directamente a la colección o se la recorre con bucles.

**Identidad vs. Igualdad**

- **Identidad (`==`):** Evalúa si dos variables apuntan al mismo objeto exacto en la memoria. La identidad de un objeto se define al crearlo y no cambia nunca, incluso si se modifican todos sus atributos.
- **Igualdad (`equals()`):** Evalúa si dos objetos distintos en memoria son considerados "iguales" según las reglas de negocio del dominio. Para que funcione, el método `equals()` debe ser redefinido dentro de cada clase.

**La pseudo-variable `this`**

- Hace referencia automática al propio objeto que está recibiendo el mensaje y ejecutando el método.
- No se le puede asignar un valor manualmente.
- Sirve para desambiguar variables de instancia, pasar el objeto a sí mismo como parámetro a otros métodos, y reutilizar comportamiento para evitar repetir código dentro de la clase.
    

**Delegación vs. Envidia**

- **Envidia:** Se da cuando un objeto pide los datos internos de otro para realizar un cálculo externo, lo que genera clases altamente acopladas y poco cohesivas (el objeto consultado se vuelve un simple contenedor de datos).
    
- **Delegación:** Es la práctica correcta donde un objeto le envía un mensaje a otro para que este último resuelva el cálculo con sus propios datos, promoviendo el desacoplamiento.
    

**Tipos, Interfaces y Polimorfismo**

- Como Java es un lenguaje estáticamente tipado, el compilador verifica que solo se envíen a una variable los mensajes que su tipo declarado entienda.
    
- **Interfaces:** Permiten definir un tipo declarando solo las firmas de los métodos, sin escribir su implementación. Esto desacopla completamente el tipo de dato de la implementación real, permitiendo que múltiples clases distintas implementen la misma interfaz.
    
- **Polimorfismo:** Ocurre cuando objetos de clases diferentes son capaces de entender el mismo mensaje, aunque cada uno lo implemente (y reaccione) de una manera distinta.
    
- El polimorfismo bien aplicado reemplaza las sentencias `if` que consultan de qué clase es un objeto. Permite extender el sistema agregando nuevas clases sin modificar el código existente, logrando programar "por protocolo" y no por implementación.


- **Clase abstracta:** una clase real, con estado y comportamiento que las subclases heredan tal cual, más algunos métodos `abstract` (sin cuerpo) que cada subclase está obligada a completar. También pueden sobreescribir (`@Override`) métodos ya implementados si necesitan otro comportamiento.
- **Interfaz:** un contrato puro — declara qué métodos debe tener una clase (mismo nombre, misma firma), sin implementación. Cada clase que la implementa decide cómo cumple ese contrato, de forma totalmente independiente de las demás.

---
## Clase abstracta vs Interfaz
**Estado (variables)**

- Clase abstracta: sí, puede tener variables de instancia (estado propio y mutable de cada objeto), y las subclases lo heredan.
- Interfaz: no. Cualquier campo declarado es automáticamente `public static final` (una constante compartida), nunca estado propio de un objeto.

**Instanciación**

- Ninguna de las dos se puede instanciar directamente (`new` sobre una clase abstracta o una interfaz da error). En ambos casos falta "algo" para ser un objeto completo y funcional.

**Herencia**

- Clase abstracta: una clase solo puede extender **una** (Java no tiene herencia múltiple de clases).
- Interfaz: una clase puede implementar **varias** a la vez.

**Cuándo usar cada una**

|Preguntate...|Usá...|
|---|---|
|¿No comparten código ni atributos, solo la firma de los métodos?|Interfaz|
|¿Necesita cumplir varios contratos distintos a la vez?|Interfaz|
|¿Comparten atributos o código concreto real?|Clase abstracta|
|¿Hay una relación de identidad ("es-un") conceptualmente fuerte?|Clase abstracta|

**Regla mental:** interfaz = "puede hacer esto" (capacidad/contrato). Clase abstracta = "es esto" (identidad + implementación compartida).
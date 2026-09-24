## Entidades vs Value Object.
private final String calle = constante por el final.
- Entidades o clases del dominio: tienen identificador, son modificables y comparables por identidad.
- Value object: objetos que su objetivo es que representen valor, no nos interesa su identidad.
  - Caracteristicas:
  - son comparables por contenido, no tienen identificador
  - Inmutables (No setters), no cambian ni modifican su valor. Sino no es un value Object.
## Heuristicas para asignacion de responsabilidades (HAR)

- Polimorfistmo: permite tener programas que segun el tipo que varien su comportamiento.
- Evitar diseñar objetos que recorren o vneivan mensajes a objetos distantes o indirectos.
  - Self/this, parametro del metodo, obj que esta asociado con self/this, un miembro de una coleccion atributo de self/this, un obj creado dentro del metodo. Los demas <font color="#ff0000">Extraños</font>
### Herencia vs composicion:
  - Herencia
    - Herencia es Total: debo conocer todo el codigo que se hereda.
    - Los cambios en super afectan a subclases.
    - 2 tipos, Herencia de estructura y Herencia comportamiento
    - + Acoplacion
  - Composicion
    - Los objetos pueden reutilizarse a traves de su interfaz
    - Los obj se componen en forma dinamica
    - - Acoplacion
## Principios S O L I D
Relacionados a las HAR para buen diseño orientado a obj, con alta cohesion y bajo acomplamiento.
### S(SRP The single-Responsability principie):
una clase deberia ser responsable de una tarea y mod por una sola razon.
### O (OCP The open-Closed principie):
Entiddes deben ser abiertas (capaz de añadir funcionalidades), cerrado (al añadir una nueva funcionalidad no cambia diseño)
- las var instancias deben ser privadas
- evitar var globales
- usar id de tipos
### L (LSP The liskov subtitution principie):
Si se utiliza una clase a que tiene subclases, se debe poder usar cualquiera de sus sub y seguir siendo valido
### I (ISP The INterface-Segregation Principie):
Las clases no deberian depender de interfaces que no utilizan
### D(DIP The Dependency-Inversion Principie)
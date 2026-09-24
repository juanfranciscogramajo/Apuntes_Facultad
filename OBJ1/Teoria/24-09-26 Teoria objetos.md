## Entidades vs Value Object.
private final String calle = constante por el final.
- Entidades o clases del dominio: tienen identificador, son modificables y comparables por identidad.
- Value object: objetos que su objetivo es que representen valor, no nos interesa su identidad.
  - Caracteristicas:
  - son comparables por contenido, no tienen identificador
  - Inmutables (No setters), no cambian ni modifican su valor. Sino no es un value Object.
## Heuristicas para asignacion de responsabilidades (HAR)

- Polimorfistmo: permite tener programas que segun el tipo que varien su comportamiento.
- Evitar diseñar objetos que recorren o vneivan mensajes a objetos distantes o indirectos
- Self/This: 
- Tablas de decision: permite presentar de forma concisa y lógica las reglas que se deben utilizar para decidir qué acciones ejecutar frente a un problema específico.
---
## Construccion:
se contruyen con condiciones simples(V/F) y acciones simples. 2N reglas, n=cant condiciones.
- Pasos: 
  1- Identificar condiciones y acciones
  2- Completar tabla, si n condiciones excluyentes n-1 en la tabla, cond deben atomicas, eliminar inconsistencias(sit impo).
  3- Construir reglas.
  4- Asociar las acciones a las reglas.
  5- Simplificar tabla.![[Pasted image 20261010203740.png]]
- Reduccion de complejidad: combinar reglas donde una alternativa no afecta el resultado, el guion es q no importa si v o f 
  ![[Pasted image 20261010203859.png]]
  ![[Pasted image 20261010204049.png]]
- Especificaciones completas: determinan accion/es para las reglas posibles. se debe. No dejar reglas sin accion para hacer, sino se crea una.
- Especificaciones redundantes: mismas condiciones, mismas acciones. Evitar
- Contradictorias: mismas condiciones distintas acciones. Evitar
  ![[Pasted image 20261010204806.png]]
  ![[Pasted image 20261010205017.png]]
## Analisis Estructurado:
- **Definicion:** Es una técnica de representación gráfica que hace énfasis en cómo se mueven, procesan y transforman los datos dentro de un sistema, sin especificar aspectos físicos de su implementación.
- **Diagrama de flujo de datos:** herramienta ppal que visualiza al sistema como una red funcional.
  **Elementos:**
  - Rectangulo: una entidad externa, elem del sist o otro sist.
  - Circulo/Burbuja: un proceso o tranformacion a datos y los mod.
  - Flecha: flujo para uno o mas elementos de datos.
  - Rectangulo abierto(lado iz y der) almacen de datos
    ![[Pasted image 20261010210143.png]]
  - Ej:
    ![[Pasted image 20261010210318.png]]
- Diccionario de datos: listado organizado de tod
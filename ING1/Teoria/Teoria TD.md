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
  - Pasos: 
    1- Redactar eventos y id Entidades eternas, flujo de datos, procesos, almacenes de datos
    2- Crear diagrama que muestre lo identificado en 1
    3- dibujar el diagrama 0, con procesos grales y almacenes.
    4- dibujar diagrama hijo por cada uno de los procesos del diagrama 0.
  - Ej:
    ![[Pasted image 20261010210318.png]]
- Diccionario de datos: Es un listado organizado que define sin ambigüedad todos los elementos de datos, especificando el tipo, nombre y descripción del contenido de la información del sistema.
- Diagrama de contexto: Es el nivel más alto que muestra al sistema completo como un único proceso interaccionando con las entidades externas y los flujos globales. (DC)
- Nivel 0: Amplia el DC, incluye hasta 9 procesos y mostrar los almacenes de datos y nuevos flujos.
- Nivelacion de un DFD: cada proceso puede ampliarse para crear un diagrama hijo mas detallado, Las E/S del proceso padre permanecen y pueden aparecer nuevos almacenes y nuevos flujos.
  - Ascendentes: agrupa las burbukas con algun criterio
  - Descendentes: descompone las burbujas funcionalmente.
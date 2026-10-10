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
- Especificaciones completas: determinan accion/es para las reglas posibles
- Especificaciones redud
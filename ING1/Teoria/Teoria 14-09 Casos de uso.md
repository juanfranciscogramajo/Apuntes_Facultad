Tecnica caso de uso: inicio 1992 jacobson, proceso de modelado de funcionalidades de eventos que interactuan entre usuario y sistema. Facilita y alienta participacion de usuarios.
Beneficios:
- herramienta para capturar requerimentos funcionales
- Facil de entender
- Permite estimar alcande y esfuerzo del proyecto.
- Define linea base pra def de planes de prueba
- Seguimiento de los requisitos.
## Diagrama de casos de uso
Ilustra interaccion entre sistema y actores.
- Ej:
![[Pasted image 20260914112240.png|242]]
Simbolos: 
- Caso de uso: rep funcionalidad individual del sist, describe secuencia de actividades y de interacciones.
-  Actores: Un actor inicia una actividad en el sistema. Rep al usuario, puede ser persona, sist externo o disp externo q dispare evento
- Flechas: 
  - asociaciones: Relacion entre un actor y un CU, interactuando entre si.
  - Extensiones(Extends): un CU extiende funcionalidad de otro CU. Un CU puede tener muchos CU extensiones. Los CU extensiones solo son iniciados por un CU.
    EJ:
     ![[Pasted image 20260914113015.png]]
  - Uso(Uses): Reduce redundancia entre 2 o mas CU al combinar pasos comunes de los CU.
    EJ:
     ![[Pasted image 20260914113255.png]]
  - Herencia: Relacion entre actores, Un actor hereda funcionalidades de uno o mas actores.
    Ej: 
    ![[Pasted image 20260914113539.png]]
## Escenarios
Descripcion de interaccion entre actor y sistema y los eventos alternativos.
![[Pasted image 20260914113900.png]]
## Proceso de modelado
Pasos:
- Identificar actores: se buscan en doc, manuales, pp reuniones, doc de requerimientos y deben responder a preguntas quien o que proporciona entradas o recibe salidas, si se requiere interfaces y quien mantendra la info en el sist. <font color="#ff0000">Se deben nombrar con un sustantivoo frase sustantiva</font>
- identificar CU para requerimientos: CU deben representar una funcionalidad concreta. Responder preguntas, cuales son las tareas del actor, que info necesita el actor, que infor prop el actor, que debe hacer el sist.
- construir diagrama
- realizar escenarios
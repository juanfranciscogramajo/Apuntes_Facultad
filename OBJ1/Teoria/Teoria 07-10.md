Resolucion ejercicio: 
Enunciado – presupuesto de excursiones

Se está desarrollando un sistema para una empresa que organiza excursiones, con el objetivo de calcular el costo total de los presupuestos que prepara para sus clientes. Cada presupuesto puede estar compuesto tanto por excursiones como por alquileres de equipos. El sistema debe ser capaz de manejar ambos tipos de elementos y calcular su costo total de manera integrada.

De las excursiones es importante conocer el costo del traslado de ida y vuelta, el costo del guía, el valor del seguro, y una lista de lugares que se visitarán (representada como una lista de cadenas de texto). Por su parte, de alquileres de equipos se desea conocer el costo por día del equipo, la cantidad de días que se alquila, y el nombre del equipo (por ejemplo, "carpa").

El precio de una excursión se calcula sumando el costo del traslado, el valor del seguro, y el costo total del guía. Este último se obtiene multiplicando el costo del guía por el número de lugares incluidos en la lista. El precio de un alquiler de equipo se calcula multiplicando el costo diario por el número de días de alquiler.

Además, se sabe para cada cliente cuáles fueron los presupuestos contratados previamente. Así, la empresa diferencia los costos finales que pagará cada cliente, según qué tan buen cliente haya sido hasta la fecha. De esta forma, a los clientes que hayan tenido en su historial más de 5 presupuestos contratados y que acumulen más de 1 millón de pesos se les otorga un descuento del 10 %.

El objetivo específico es determinar el costo de un presupuesto para un cliente en particular.

Pasos para resolverlo: 
- 1- Marcar conceptos que pueden ser atributos/comportamiento/clases etc.
- 2-Definir lo marcado a que corresponde cada concepto, si es clase atributo etc.
  Excursion c
  presupuesto c
  cliente C
  alquiler de equipos C
  costo de translado ida y vuelta A
  costo del guia A
  valor del seguro A
  liista de lugares A
  costo por dia A 
  Cantidad de dias A 
  Nombre A
  Presupuestoscontratados A???
- 3- Diagrama uml Draw.io 
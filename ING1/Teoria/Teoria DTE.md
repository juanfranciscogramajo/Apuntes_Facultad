- Maquina de estado finito: describe al sist como conjunto de estados que reacciona a eventos.
  ![[Pasted image 20261010000348.png]]
- ![[Pasted image 20261010000525.png]]
- Evento: suceso que influye en el comportamiento del sistema. En un punto de tiempo no duracion.
- Transicion: consecuencias de eventos, pueden o no tener procesamiento asociado. Si hay una transicion es xq ocurrio un evento, no viceversa. Puede tener condiciones logicas y acciones.
## Pasos para construir un DTE
1- Identificar Estados
2- Si hay un estado complejo se puede explotar
3- Identificar el estado inicial
4- Analizar condiciones y acciones de un estado a otro
5- Verificar consistencia:
- def todos los estados
- se pueden alcanzar todos los estados
- se puede salir de tds los esados
- En cada estado el sist responde a todas las condiciones.
![[Pasted image 20261010002844.png]]
Ver ejemplos Clase.
- **Ventajas:** Utilizar un DTE mejora la comprensión general gracias a su mapa visual, previene errores lógicos desde la etapa de diseño, valida que se consideren todos los requisitos y facilita la planificación de pruebas de software.
    
- **Desventajas:** Como contrapartida, los diagramas pueden volverse excesivamente complejos y difíciles de manejar ante una gran cantidad de estados. Además, se enfocan típicamente en un solo objeto por diagrama y no son ideales para modelar la concurrencia.
    
- **Casos de Uso Ideales:** Se recomienda aplicar los DTE en sistemas de tiempo real, en el modelado de interfaces de usuario complejas, en el diseño de algoritmos de control y en aquellos sistemas que operen con un número finito y bien definido de estados.
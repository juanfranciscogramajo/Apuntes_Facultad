2. ![[ej_2__conceptual.jpg]]

3. ![[modelo_sin_t_tulo_conceptual (1).jpg]]
4. ![[modelo_sin_t_tulo_conceptual (2).jpg]]
5. ![[ej_5_conceptual.jpg]]
   Alternativa 2:  
   Ventajas:
   - Le da identidad propia a cada "paso por un área" — más fácil de referenciar, consultar o extender en el futuro (por ejemplo, si mañana quisieran agregar quién aprobó el cambio de área, ya hay una entidad donde colgarlo).
   - Evita ambigüedades: cada asignación es una instancia bien definida, no una ocurrencia difusa de una relación N:M.
   - Es más escalable si el historial necesita más atributos con el tiempo.
   Desventajas:
   - Agrega una entidad extra al modelo cuando quizás no hace falta (más complejidad de la necesaria) 
   - Requiere pensar bien el identificador (compuesto o externo), lo que puede generar dudas de diseño (¿es débil? ¿qué la identifica?).
   Alternativa 3:  
   Ventajas:
   - Separa claramente "dónde trabaja hoy" de "por dónde pasó" 
   - Evita tener que consultar "cuál registro no tiene fecha hasta" para saber el área actual.
   Desventajas:
   - Duplica información: el área actual del empleado termina registrada dos veces (una en la relación "actual" y otra, eventualmente, en el historial cuando ese período se cierre), hay riesgo de inconsistencia si no se sincronizan bien ambas relaciones.
   - Es más complejo de mantener: cada vez que un empleado cambia de área, hay que "cerrar" el registro histórico Y actualizar la relación de área actual (dos operaciones en vez de una)
6. ![[modelo_sin_t_tulo__1__conceptual.jpg]]
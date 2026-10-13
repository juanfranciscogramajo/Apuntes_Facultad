### Parte I: Definiciones generales 
a) Describa qué es el desarrollo centrado en el usuario. 
Es un enfoque o filosofía de desarrollo de software en el que el usuario final ocupa el centro de todas las decisiones de diseño, a lo largo de todo el proceso de desarrollo, no solo al principio (relevamiento de requerimientos) ni al final (pruebas de aceptación).

b) Defina qué son los casos de uso y describa cómo se utilizan.
Casos de uso: Descripción de cómo los distintos actores (personas, sistemas externos o eventos como el tiempo) interactúan con el sistema para lograr un objetivo específico. 
Representan los escenarios de interacción que permiten entender los requerimientos funcionales desde la perspectiva del usuario o actor.
Proceso de modelado:
- 1- Identificar los actores: determinar quiénes o qué interactúa con el sistema desde afuera, pueden ser personas (con distintos roles), otros sistemas externos con los que el sistema se comunica, o eventos (como el paso del tiempo, disparando una tarea programada).
    
- 2- Identificar los casos de uso: para cada actor, determinar qué objetivos quiere lograr al interactuar con el sistema. Cada objetivo concreto se convierte en un caso de uso (verbo + sustantivo: "Solicitar turno", "Consultar estado").
    
- 3- Construir el diagrama: representar gráficamente actores y casos de uso, y las relaciones entre ellos (asociación, inclusión `<<include>>`, extensión `<<extend>>` generalización), da una vista general de qué puede hacer el sistema y quién lo puede hacer, sin entrar en el detalle de cada interacción.
- 4- Realizar los escenarios: para cada caso de uso, describir el flujo de pasos concreto que ocurre entre el actor y el sistema: incluyendo un escenario principal (éxito) y escenarios alternativos/de excepción (los casos donde algo falla o se desvía del camino esperado)
c) Defina qué es un actor y un escenario. 
Actor: Un actor es toda entidad externa al sistema que interactúa directamente con él para lograr un objetivo. Puede ser una persona (desempeñando un rol específico), un sistema externo, o un evento (como el transcurso del tiempo, disparando una tarea programada). No representa a una persona en particular, sino a un rol que cualquier persona u otro sistema puede cumplir.

Escenario: Un escenario es una secuencia específica y concreta de pasos que describe una posible ejecución de un caso de uso, detallando la interacción paso a paso entre el actor y el sistema. Un mismo caso de uso puede tener varios escenarios: uno principal (de éxito, el camino esperado sin inconvenientes) y varios alternativos o de excepción (que cubren desvíos, errores o condiciones especiales)

d) Defina las relaciones que pueden presentarse en el diagrama de casos de uso. Describa cuándo se utiliza cada una. 
Asociaciones: es la relación entre un actor y un caso de uso, e indica que ese actor participa directamente en la ejecución de dicho caso de uso. Es la relación básica del diagrama, la que conecta "quién" con "qué puede hacer".

Uso o Inclusión (Uses): es una relación entre dos casos de uso, donde uno de ellos (el caso base) necesita obligatoriamente ejecutar al otro (el caso usado) como parte de su flujo normal. Se utiliza cuando hay un comportamiento común que se repite en varios casos de uso, y conviene extraerlo una sola vez en lugar de duplicarlo en cada uno. Por ejemplo, "Solicitar turno" y "Cancelar turno" podrían ambos usar a "Autenticarse", ya que autenticarse es un paso obligatorio y compartido por los dos.

Extensiones (Extends): es también una relación entre dos casos de uso, pero a diferencia de la inclusión, representa un comportamiento opcional o condicional: el caso base puede completarse perfectamente sin necesidad de ejecutar el caso que lo extiende. Se utiliza cuando una funcionalidad adicional solo se activa bajo determinada condición. Por ejemplo, "Cerrar reclamo" podría ser extendido por "Adjuntar acta", que solo se ejecuta si la resolución del reclamo es negativa.

Herencia: puede darse entre dos actores o entre dos casos de uso, y representa que uno de ellos es una especialización del otro, heredando su comportamiento base y pudiendo agregar variantes propias. Se utiliza, por ejemplo, cuando existen distintos tipos de actores que comparten los mismos casos de uso generales pero uno de ellos tiene funcionalidades adicionales (como "Socio Premium" y "Socio Regular" derivando de "Socio"), o cuando un caso de uso general tiene variantes específicas de ejecución (como "Pagar con tarjeta" y "Pagar en efectivo" derivando de "Pagar").

e) Enumere los beneficios de modelar requerimientos del sistema con casos de uso.
1. Facilitan la comunicación con el usuario/cliente.
    
2. Ponen el foco en el usuario y sus objetivos, no en la estructura interna del sistema.
    
3. Ayudan a delimitar el alcance del sistema (scope).
    
4. Sirven de base para otras etapas del desarrollo (diseño de pruebas, estimación de esfuerzo, diseño de interfaz).
    
5. Permiten detectar requerimientos faltantes o ambiguos tempranamente.
    
6. Facilitan la reutilización y organización de funcionalidad común (mediante Uses y Extends).
    
7. Proveen trazabilidad entre requerimientos y funcionalidad implementada.

### Parte 2: ejercicios

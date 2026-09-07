**Rol de usuarios:

==Historias de usuario:==

==FRENTE==

ID:

==Titulo==: Como quiero para

REGLAS DE NEGOCIO:

REVERSO

Criterios de aceptación:

Escenario :

Dado

cuando

entonces

  

1-

Rol de usuarios:

Encargado del departamento de mobiliario.  
Cliente

Historias de usuario:

Dar de alta mobiliario.  
Reserva de alquiler  
  
  

FRENTE

ID:

Dar de Alta un mueble

Título:  
Como Encargado del departamento de mobiliario quiero dar de alta un mueble para que esté disponible para ser alquilado

REGLAS DE NEGOCIO:  
No puede existir códigos de inventarios repetidos.  
Autenticación del encargado para dar de alta.  
El registro de los usuarios de carga no debe modelarse.  
Estados posibles son únicamente: libre, de baja o alquilado 

REVERSO

Criterios de aceptación (Dar de alta un mueble):

Escenario 1: Alta exitosa

Dado que el administrador se autentico y el código de inventario "M-001" no existe en el sistema,

cuando ingresa los datos obligatorios (tipo, fechas, estado, precio) y confirma el alta, 

entonces el sistema guarda el mueble exitosamente y queda disponible para alquiler. 

Escenario 2: Alta fallida por codigo de inventario existente  
Dado  que el administrador se autentico sistema y el código de inventario "M-001" existe en el sistema,  
cuando ingresa los datos obligatorios (tipo, fechas, estado, precio) y confirma el alta,  
entonces el sistema informa que el código de inventario ingresado ya se encuentra en el sistema..

  
  
  

Escenario 3: Alta fallida por falta de autenticación 

Dado que el usuario no se encuentra autenticado en el sistema,

cuando intenta dar de alta un mueble,

entonces el sistema bloquea la acción y solicita la autenticación.

FRENTE

ID: Hacer reserva de un alquiler

Título: Como cliente quiero hacer una reserva para alquilar muebles para un evento

REGLAS DE NEGOCIO:

Mínimo reserva 3 muebles.  
Se debe abonar el 20% del total del alquiler  
El pago de la reserva se realiza únicamente con tarjeta de crédito  
Se debe validar el número de tarjeta y fondos a través de un servicio del banco.  
Se emite un número de reserva único que será luego utilizado por el cliente para hacer efectivo el alquiler. 

REVERSO

Criterios de aceptación:(Hacer una reserva de alquiler de un mueble)

Escenario 1: Reserva exitosa

Dado que el cliente seleccionó al menos 3 muebles e ingresó los datos del evento (fecha, lugar y cantidad de días), 

cuando ingresa una tarjeta de crédito válida con fondos suficientes para abonar el 20% del total, 

entonces el sistema procesa el pago a través del banco y emite un número de reserva único para el cliente. 

Escenario 2 Reserva fallida por cantidad de muebles menor a 3

Dado que el cliente seleccionó menos de 3 muebles (ej. 1 o 2)  
cuando intenta avanzar para confirmar la reserva,  
entonces el sistema bloquea la acción y le informa que la cantidad mínima para reservar es de 3 muebles.

Escenario 3: Reserva fallida medio de pago invalido

Dado que el cliente se encuentra en la pantalla de pago de la reserva,  
cuando intenta ingresar una tarjeta de débito u otro medio de pago distinto a tarjeta de crédito,  
entonces el sistema rechaza el medio de pago indicando que solo se aceptan tarjetas de crédito. 

  
  

Escenario 4: Reserva fallida por saldos insuficientes

Dado que el cliente confirma los datos de pago con una tarjeta de crédito  
cuando el sistema valida los fondos a través del servicio del banco y estos son insuficientes para cubrir el 20%,  
entonces la operación es cancelada y el sistema informa al cliente que la tarjeta no posee saldo suficiente. 

2-

Rol de usuarios:  
Conserje.  
Usuario.

Historias de usuario:  
Reservar un hospedaje.  
Realizar check-in.  
Realizar check-out.

FRENTE

ID: Reservar un hospedaje

Título: Como usuario quiero reservar un hospedaje para mis vacaciones

REGLAS DE NEGOCIO:  
Fecha de ingreso dentro de los 90 días a partir de la fecha actual.  
Las estadías no pueden durar más de 15 días.  
Los check in entre las 10am y las 23:59pm.  
Solo check out habitaciones sin gastos.

REVERSO

Criterios de aceptación: (Reserva de hospedaje)

Escenario 1: Reserva exitosa

Dado los datos necesarios para realizar una reserva(fecha estadia, hotel, cantidad de huéspedes)

cuando confirma el usuario confirma la reserva,

entonces el sistema envía un mail con código de reserva y enlace para continuar con el pago.

Escenario 2: Reserva inválida por fecha de ingreso mayor a 90 días.

Dado que el usuario intenta ingresar las fechas de su viaje, 

cuando selecciona una fecha de ingreso superior a los 90 días desde el día actual 

entonces el sistema bloquea la accion y informa en pantalla la fecha de ingreso ingresada es inválida. Debe ser dentro de los próximos 90 días.

  

Escenario 3: Reserva inválida por duración de estadía mayor a 15 días.

Dado que el usuario selecciona sus fechas permitidas de ingreso, 

cuando confirma el usuario confirma la reserva,

entonces la duración del viaje supera los 15 días, entonces el sistema le informa que excede el límite permitido. 

FRENTE

ID: Realizar check in

Título: Como usuario quiero realizar el check in en la terminal para que me asigne mi habitación.

REGLAS DE NEGOCIO:  
Los check in entre las 10am y las 23:59pm.  
El codigo ingresado debe corresponder a una reserva para el dia actual.

REVERSO

Criterios de aceptación: (Realizar check in)

Escenario 1: Check in exitoso

Dado que el usuario se encuentra dentro del horario de check in

cuando ingresa su codigo el sistema confirma que tiene una reserva para la fecha actual,

entonces se envía un mensaje a un conserje para guiar al usuario a la habitación y un mensaje a los botones para encargarse de las valijas.

Escenario 2: Check in invalido por reserva no válida

Dado el código de reserva por el usuario,

cuando el usuario sigue con el proceso de check in,

entonces el sistema informa que para el codigo ingresado no existe una reserva para la fecha actual.

Escenario 3: Check in invalido por horario invalido.

Dado que el usuario ingresa el codigo de reserva,

cuando continua con el proceso de check in,

entonces el sistema informa que aun no se encuentran habilitados los ingresos al hotel

  
  
  
  
  
  

FRENTE

ID: Realizar check-out 

Título: Como conserje quiero realizar el check-out de una habitación para liberarla en el sistema.

REGLAS DE NEGOCIO:  
Solo se puede procesar el check-out en habitaciones que no tengan gastos pendientes. (Nota: el pago de gastos no se modela en esta etapa). 

REVERSO

Criterios de aceptación: (Realizar check in)

Escenario 1: Check-out exitoso 

Dado que una habitación específica no registra gastos adicionales sin abonar, 

cuando el conserje ingresa el número de esa habitación para darle salida, 

entonces el sistema la libera y envía un mensaje a las mucamas avisando que puede limpiarse. 

Escenario 2: Check-out fallido por deudas 

Dado que una habitación posee consumos o gastos pendientes de pago, 

cuando el conserje intenta ingresar su número para procesar la salida, 

entonces el sistema le advierte que no puede hacerse el check-out hasta que el usuario abone los gastos.**
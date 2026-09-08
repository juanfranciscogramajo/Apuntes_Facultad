# (PLANTILLA)[Número del Ejercicio] - [Título del Sistema/Módulo]

**Rol de usuarios:**
- [Rol 1]
- [Rol 2]

**Historias de usuario:**
- [Nombre de la historia 1]
- [Nombre de la historia 2]

> [!info] FRENTE - ID: [Nombre o código de la HU]
> **Como** [Rol del usuario]
> **Quiero** [Acción u objetivo]
> **Para** [Beneficio o valor]
> 
> > [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> > - [Regla 1]
> > - [Regla 2]
> > 
> > **Criterios de aceptación ([Nombre de la historia]):**
> > **Escenario 1: [Nombre del escenario exitoso]**
> > - **Dado** [Condición inicial]
> > - **cuando** [Acción que realiza el usuario]
> > - **entonces** [Resultado esperado del sistema]
> > 
> > **Escenario 2: [Nombre del escenario alternativo/fallido]**
> > - **Dado** [Condición inicial]
> > - **cuando** [Acción]
> > - **entonces** [Resultado]
# 1 - Alquiler de Mobiliario
**Rol de usuarios:**
- Encargado del departamento de mobiliario.
- Cliente

**Historias de usuario:**
- Dar de alta mobiliario.
- Reserva de alquiler

> [!info] FRENTE - ID: Dar de Alta un mueble
> **Como** Encargado del departamento de mobiliario
> **Quiero** dar de alta un mueble
> **Para** que esté disponible para ser alquilado
> 
> > [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> > - No puede existir códigos de inventarios repetidos.
> > - Autenticación del encargado para dar de alta.
> > - El registro de los usuarios de carga no debe modelarse.
> > - Estados posibles son únicamente: libre, de baja o alquilado 
> > 
> > **Criterios de aceptación (Dar de alta un mueble):**
> > **Escenario 1: Alta exitosa**
> > - **Dado** que el administrador se autentico y el código de inventario "M-001" no existe en el sistema,
> > - **cuando** ingresa los datos obligatorios (tipo, fechas, estado, precio) y confirma el alta, 
> > - **entonces** el sistema guarda el mueble exitosamente y queda disponible para alquiler. 
> > 
> > **Escenario 2: Alta fallida por codigo de inventario existente**
> > - **Dado**  que el administrador se autentico sistema y el código de inventario "M-001" existe en el sistema,
> > - **cuando** ingresa los datos obligatorios (tipo, fechas, estado, precio) y confirma el alta,
> > - **entonces** el sistema informa que el código de inventario ingresado ya se encuentra en el sistema..
> > 
> > **Escenario 3: Alta fallida por falta de autenticación**
> > - **Dado** que el usuario no se encuentra autenticado en el sistema,
> > - **cuando** intenta dar de alta un mueble,
> > - **entonces** el sistema bloquea la acción y solicita la autenticación.

> [!info] FRENTE - ID: Hacer reserva de un alquiler
> **Como** cliente
> **Quiero** hacer una reserva para alquilar muebles
> **Para** un evento
> 
> > [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> > - Mínimo reserva 3 muebles.
> > - Se debe abonar el 20% del total del alquiler
> > - El pago de la reserva se realiza únicamente con tarjeta de crédito
> > - Se debe validar el número de tarjeta y fondos a través de un servicio del banco.
> > - Se emite un número de reserva único que será luego utilizado por el cliente para hacer efectivo el alquiler. 
> > 
> > **Criterios de aceptación:(Hacer una reserva de alquiler de un mueble)**
> > **Escenario 1: Reserva exitosa**
> > - **Dado** que el cliente seleccionó al menos 3 muebles e ingresó los datos del evento (fecha, lugar y cantidad de días), 
> > - **cuando** ingresa una tarjeta de crédito válida con fondos suficientes para abonar el 20% del total, 
> > - **entonces** el sistema procesa el pago a través del banco y emite un número de reserva único para el cliente. 
> > 
> > **Escenario 2 Reserva fallida por cantidad de muebles menor a 3**
> > - **Dado** que el cliente seleccionó menos de 3 muebles (ej. 1 o 2)
> > - **cuando** intenta avanzar para confirmar la reserva,
> > - **entonces** el sistema bloquea la acción y le informa que la cantidad mínima para reservar es de 3 muebles.
> > 
> > **Escenario 3: Reserva fallida medio de pago invalido**
> > - **Dado** que el cliente se encuentra en la pantalla de pago de la reserva,
> > - **cuando** intenta ingresar una tarjeta de débito u otro medio de pago distinto a tarjeta de crédito,
> > - **entonces** el sistema rechaza el medio de pago indicando que solo se aceptan tarjetas de crédito. 
> > 
> > **Escenario 4: Reserva fallida por saldos insuficientes**
> > - **Dado** que el cliente confirma los datos de pago con una tarjeta de crédito
> > - **cuando** el sistema valida los fondos a través del servicio del banco y estos son insuficientes para cubrir el 20%,
> > - **entonces** la operación es cancelada y el sistema informa al cliente que la tarjeta no posee saldo suficiente. 


# 2 - Hospedaje

**Rol de usuarios:**
- Conserje.
- Usuario.

**Historias de usuario:**
- Reservar un hospedaje.
- Realizar check-in.
- Realizar check-out.

> [!info] FRENTE - ID: Reservar un hospedaje
> **Como** usuario
> **Quiero** reservar un hospedaje
> **Para** mis vacaciones
> 
> > [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> > - Fecha de ingreso dentro de los 90 días a partir de la fecha actual.
> > - Las estadías no pueden durar más de 15 días.
> > - Los check in entre las 10am y las 23:59pm.
> > - Solo check out habitaciones sin gastos.
> > 
> > **Criterios de aceptación: (Reserva de hospedaje)**
> > **Escenario 1: Reserva exitosa**
> > - **Dado** los datos necesarios para realizar una reserva(fecha estadia, hotel, cantidad de huéspedes)
> > - **cuando** confirma el usuario confirma la reserva,
> > - **entonces** el sistema envía un mail con código de reserva y enlace para continuar con el pago.
> > 
> > **Escenario 2: Reserva inválida por fecha de ingreso mayor a 90 días.**
> > - **Dado** que el usuario intenta ingresar las fechas de su viaje, 
> > - **cuando** selecciona una fecha de ingreso superior a los 90 días desde el día actual 
> > - **entonces** el sistema bloquea la accion y informa en pantalla la fecha de ingreso ingresada es inválida. Debe ser dentro de los próximos 90 días.
> > 
> > **Escenario 3: Reserva inválida por duración de estadía mayor a 15 días.**
> > - **Dado** que el usuario selecciona sus fechas permitidas de ingreso, 
> > - **cuando** confirma el usuario confirma la reserva,
> > - **entonces** la duración del viaje supera los 15 días, entonces el sistema le informa que excede el límite permitido. 

> [!info] FRENTE - ID: Realizar check in
> **Como** usuario
> **Quiero** realizar el check in en la terminal
> **Para** que me asigne mi habitación.
> 
> > [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> > - Los check in entre las 10am y las 23:59pm.
> > - El codigo ingresado debe corresponder a una reserva para el dia actual.
> > 
> > **Criterios de aceptación: (Realizar check in)**
> > **Escenario 1: Check in exitoso**
> > - **Dado** que el usuario se encuentra dentro del horario de check in
> > - **cuando** ingresa su codigo el sistema confirma que tiene una reserva para la fecha actual,
> > - **entonces** se envía un mensaje a un conserje para guiar al usuario a la habitación y un mensaje a los botones para encargarse de las valijas.
> > 
> > **Escenario 2: Check in invalido por reserva no válida**
> > - **Dado** el código de reserva por el usuario,
> > - **cuando** el usuario sigue con el proceso de check in,
> > - **entonces** el sistema informa que para el codigo ingresado no existe una reserva para la fecha actual.
> > 
> > **Escenario 3: Check in invalido por horario invalido.**
> > - **Dado** que el usuario ingresa el codigo de reserva,
> > - **cuando** continua con el proceso de check in,
> > - **entonces** el sistema informa que aun no se encuentran habilitados los ingresos al hotel

> [!info] FRENTE - ID: Realizar check-out 
> **Como** conserje
> **Quiero** realizar el check-out de una habitación
> **Para** liberarla en el sistema.
> 
>>[!warning]- REVERSO - Reglas y Criterios (Desplegable)
>>**REGLAS DE NEGOCIO:**
>>- Solo se puede procesar el check-out en habitaciones que no tengan gastos pendientes. (Nota: el pago de gastos no se modela en esta etapa). 
>>
>> **Criterios de aceptación: (Realizar check in)**
>> **Escenario 1: Check-out exitoso**
>> - **Dado** que una habitación específica no registra gastos adicionales sin abonar, 
>> - **cuando** el conserje ingresa el número de esa habitación para darle salida, 
>> - **entonces** el sistema la libera y envía un mensaje a las mucamas avisando que puede limpiarse. 
>> 
>> **Escenario 2: Check-out fallido por deudas**
>> - **Dado** que una habitación posee consumos o gastos pendientes de pago, 
>> - **cuando** el conserje intenta ingresar su número para procesar la salida, 
>> - **entonces** el sistema le advierte que no puede hacerse el check-out hasta que el usuario abone los gastos.



# 3 - Venta de bebidas
**Rol de usuarios:**
- Usuario

**Historias de usuario:**
- Registro Usuario  
- Compra de productos.

> [!info] HU FRENTE - ID: Registro Usuario
> **Como** persona
> **Quiero** Registrar mis datos
> **Para** poder hacer una compra de bebidas alcoholicas
> 
> > [!info]- HU REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> > - Se registren al sitio personas mayores a 18 años y mostrar en pantalla el texto de la ley que impide la venta de bebidas alcohólicas a menores.
> > - Si el registro es exitoso el sistema genera una contraseña que es enviada al email ingresado en el registro.
> >
> > **Criterios de aceptación (Registro de usuario):**
> > 
> > **Escenario 1: Registro exitoso**
> > - **Dado** los datos de una persona mayor a 18 años y con mail unico 
> > - **cuando** el usuario confirma los datos
> > - **entonces** el sistema genera una contraseña que es enviada al email ingresado en el registro
> > - 
> > **Escenario 2: Fallo en registro por mail de usuario repetido**
> > - **Dado** el ingreso de datos de una persona mayor a 18 anIos 
> > - **cuando** el usuario confirma los datos ingresados,
> > - **entonces** el sistema informa de un error ya que el mail se encuentra registrado.
> > - 
> >**Escenario 3 Fallo en registro por edad ingresada**
> > - **Dado** el ingreso los datos personales 
> > - **cuando** el usuario ingresa una edad menor a 19 años,
> > - **entonces** el sistema muestra en pantalla el texto de la ley que impide la venta de bebidas alcohólicas a menores

> [!info] FRENTE - ID: Compra de productos
> **Como** usuario
> **Quiero** seleccionar productos 
> **Para** luego comprarlos
> 
> > [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> > - Usuario premium 20% de descuento y se informa.
> > - Monto total mayor a $4500 se hace 10% de descuento y se informa.
> > - Usuario premium se puede acumular ambos descuentos.
> > 
> > **Criterios de aceptación (Compra de productos):**
> > **Escenario 1: Compra cliente premium con 10% descuento**
> > - **Dado** que el cliente inicia sesión como premium,
> > - **cuando** selecciona los productos que desea comprar y como el monto total supera $4500,
> > - **entonces**  se le realiza un 10% ademas del 20% por ser premium y informa el monto total de los productos seleccionados.
> > 
> > **Escenario 2: Compra cliente premium**
> > - **Dado** un inicio de sesión de un cliente premium,
> > - **cuando** el cliente selecciona productos que desea comprar y el monto es menor a $4500,
> > - **entonces** el sistema le realiza un 20% de descuento por ser cliente premium y informa el monto total de los productos seleccionados.
> > 
> > **Escenario 3: Compra cliente con 10%**
> > - **Dado** un inicio de sesión de un cliente,
> > - **cuando** el cliente selecciona productos que desea comprar y el monto es mayor a $4500,
> > - **entonces** el sistema le realiza un 10% de descuento por ser cliente premium y informa el monto total de los productos seleccionados.
> > 
> > **Escenario 4: Compra cliente**
> > - **Dado** un inicio de sesión de un cliente,
> > - **cuando** el cliente selecciona productos que desea comprar y el monto es menor a $4500,
> > - **entonces** el sistema informa el monto total de los productos seleccionados en pantalla.
# 4 - Prestamos de Kits

**Rol de usuarios:**
- Usuario
- Administradores

**Historias de usuario:**
- Préstamo de un kit
- Agregar nuevos elementos

> [!info] FRENTE - ID: Prestamo de un kit
> **Como** usuario (estudiante o docente)
> **Quiero** solicitar el préstamo de un kit
> **Para** un trabajo academico.
> 
> > [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> > - Los prestamos no pueden durar mas de 3 horas
> > - Un usuario no puede solicitar un préstamo si tiene algún préstamo anterior activo
> > 
> > **Criterios de aceptación (Prestamo de un kit):**
> > **Escenario 1: Usuario realiza un prestamo correctamente**
> > - **Dado** un usuario que previamente inicio sesion,
> > - **cuando** selecciona el kit basico, dia 8, hora 12:00 y la duracion de 2 horas,
> > - **entonces** el sistema detecta que el usuario no tiene ningún préstamo activo y lo registra en la web.
> > 
> > **Escenario 2: Usuario intenta prestamo mayor a 3 horas**
> > - **Dado** un usuario autenticado,
> > - **cuando** selecciona el kit avanzado, dia 9, hora 11, y duracion de 5 horas,
> > - **entonces** el sistema indica que la duracion maxima de un prestamo es 3 horas.
> > 
> >**Escenario 3: Usuario intenta prestamo teniendo uno activo**
> > - **Dado** un usuario autenticado,
> > - **cuando** elige la opcion de realizar un prestamo,
> > - **entonces** el sistema le informa que tiene un prestamo activo.
> > 
> >**Escenario 4: Usuario intenta prestamo sin autenticarse**
> > - **Dado** un usuario,
> > - **cuando** elige la opcion de realizar un prestamo,
> > - **entonces** el sistema le informa que debe autenticarse para poder realizar un prestamo.
> >

 >[!info] FRENTE - ID: Agregar elementos
> **Como** administrador
> **Quiero** agregar nuevos elementos
> **Para** formar parte de un kit y se pueda prestar
> 
> > [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> > - Precio de compra no puede superar el millón de pesos
> > - Un usuario no puede solicitar un préstamo si tiene algún préstamo anterior activo
> > 
> > **Criterios de aceptación (Agregar elementos al kit):**
> > **Escenario 1: El administrador ingresa elementos al kit**
> > - **Dado** un administrador 
> > - **cuando** selecciona el kit basico, dia 8, hora 12:00 y la duracion de 2 horas,
> > - **entonces** el sistema detecta que el usuario no tiene ningún préstamo activo y lo registra en la web.
> > 
> > **Escenario 2: Usuario intenta prestamo mayor a 3 horas**
> > - **Dado** un usuario autenticado,
> > - **cuando** selecciona el kit avanzado, dia 9, hora 11, y duracion de 5 horas,
> > - **entonces** el sistema indica que la duracion maxima de un prestamo es 3 horas.
> > 
> >**Escenario 3: Usuario intenta prestamo teniendo uno activo**
> > - **Dado** un usuario autenticado,
> > - **cuando** elige la opcion de realizar un prestamo,
> > - **entonces** el sistema le informa que tiene un prestamo activo.
> > 
> >**Escenario 4: Usuario intenta prestamo sin autenticarse**
> > - **Dado** un usuario,
> > - **cuando** elige la opcion de realizar un prestamo,
> > - **entonces** el sistema le informa que debe autenticarse para poder realizar un prestamo.
> >






















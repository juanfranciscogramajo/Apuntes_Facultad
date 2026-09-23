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
- Inicio de sesion
- cierre de sesion

> [!info] HU FRENTE - ID: Iniciar Sesion
> **Como** persona
> **Quiero** iniciar sesion en mi cuenta
> **Para** poder hacer una compra de bebidas alcoholicas
> 
> > [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> >- El usuario debe encontrarse registrado previamente en el sistema. 
> >- La contraseña ingresada debe coincidir con la registrada para dicho usuario.
> >
> > **Criterios de aceptación (Iniciar sesion):**
> > 
> > **Escenario 1: Inicio de sesión exitoso**
> >- **Dado** el nombre de usuario pablo29@gmail.com que se encuentra registrado en el sistema y la contraseña 1234 que coincide con el nombre de usuario,
> >- **cuando** el usuario ingresa pablo29@gmail.com, contraseña 1234 y presiona “Iniciar sesión”,
> >- **entonces** el sistema abre la sesión del usuario y muestra la lista de bebidas alcohólicas.
> >**Escenario 2: Inicio de sesión fallido por contraseña incorrecta** 
> >- **Dado** el nombre de usuario rique23@gmail.com el cual se encuentra registrado y la contraseña 2020 que no coincide con el nombre de usuario,
> >- **cuando** el usuario ingresa rique23@gmail.com, contraseña 2020 y presiona “Iniciar sesión”,
> >- **entonces** el sistema informa “Datos incorrectos”.
> >**Escenario 3: Inicio de sesión fallido por nombre usuario inexistente **
> >- **Dado** el nombre de usuario fantoche1999@gmail.com el cual no se encuentra registrado,
> >- **cuando** el usuario ingresa fantoche199@gmail.com, contraseña 2020 y presiona “Iniciar sesión”,
> >- **entonces** el sistema informa “Datos incorrectos”.

> [!info] HU FRENTE - ID: Cerrar Sesion
> **Como** persona
> **Quiero** cerrar sesion en mi cuenta
> **Para** salir del sistema
> 
> > [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> >- El usuario debe poseer una sesión activa previamente en el sistema.
> >
> > **Criterios de aceptación (Cerrar sesion):**
> >
> > **Escenario 1: ciere de sesión exitoso**
> >- **Dado** el usuario lorsrosa@gmail.com con la sesión iniciada,
> >- **cuando**  el usuario presiona “Cerrar sesión”,
> >- **entonces** entonces el sistema cierra la sesión del usuario y redirige a la pantalla de iniciar sesión.

> [!info] HU FRENTE - ID: Registro Usuario
> **Como** persona
> **Quiero** Registrar mis datos
> **Para** poder hacer una compra de bebidas alcoholicas
> 
> > [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> > - Se registren al sitio personas mayores a 18 años y mostrar en pantalla el texto de la ley que impide la venta de bebidas alcohólicas a menores.
> > - Si el registro es exitoso el sistema genera una contraseña que es enviada al email ingresado en el registro.
> >
> > **Criterios de aceptación (Registro de usuario):**
> > 
> > **Escenario 1: Registro exitoso**
> > - **Dado** el mail [persona1@gmail.com](mailto:persona1@gmai.com) que no se encuentra registrado y la edad es de 21 años.
> > - **cuando**  la persona ingresa nombre “Riquelme”, apellido “Diaz”, mail [rique123@gmail.com](mailto:rique123@gmail.com) el cual no se encuentra registrado, edad 21 y presiona “Registrarse”.
> > - **entonces** el sistema valida el registro y genera una contraseña que es enviada al email ingresado en el registro.
> > **Escenario 2: Fallo en registro por mail de usuario repetido**
> > - **Dado** el mail [persona1@gmail.com](mailto:persona1@gmai.com) que se encuentra registrado y la edad es de 21 años
> > - **cuando** la persona ingresa nombre “Riquelme”, apellido “Diaz”, mail [rique123@gmail.com](mailto:rique123@gmail.com) el cual se encuentra registrado, edad 17 y presiona “Registrarse”.
> > - **entonces** el sistema bloquea la accion y informa:  "El mail se encuentra registrado".
> >**Escenario 3 Fallo en registro por edad ingresada**
> > - **Dado** el mail [persona1@gmail.com](mailto:persona1@gmai.com) que se encuentra registrado y la edad es de 17 años
> > - **cuando** la persona ingresa nombre “Riquelme”, apellido “Diaz”, mail [rique123@gmail.com](mailto:rique123@gmail.com) el cual no se encuentra registrado, edad 17 y presiona “Registrarse”.
> > - **entonces** el sistema muestra en pantalla el texto de la ley que impide la venta de bebidas alcohólicas a menores.

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
> > - **Dado** el usuario [cristi120@gmail.com](mailto:cristi120@gmail.com) que es premium, la bebida seleccionada es “Smirnoff” con precio de 5000 pesos y se dispone de stock disponible para la bebida seleccionada.
> > - **cuando** selecciona la bebida “Smirnoff” con precio de 5000 pesos y presiona “Aceptar”.
> > - **entonces**  se le realiza un 10% ademas del 20% por ser premium y informa el monto total de los productos seleccionados.
> > 
> > **Escenario 2: Compra cliente premium**
> > - **Dado** el usuario [pepe@gmail.com](mailto:pepe@gmail.com) que es premium, las bebidas seleccionadas son “Corona” con precio de 2000 pesos y se dispone de stock disponible para las bebidas seleccionadas.
> > - **cuando** selecciona “Corona” con precio de 2000 pesos y presiona “Aceptar”,
> > - **entonces** el sistema le realiza un 20% de descuento por ser cliente premium y informa el monto total de los productos seleccionados.
> > 
> > **Escenario 3: Compra cliente con 10%**
> > - **Dado** el usuario [pepe@gmail.com](mailto:pepe@gmail.com) que no es premium, las bebidas seleccionadas son “Corona” con precio de 2000 pesos, “Stellla Artois” con precio 3000 pesos, y se dispone de stock disponible para las bebidas seleccionadas.
> > - **cuando** selecciona “Corona” con precio de 2000 pesos, “Stellla Artois” con precio 3000 pesos y presiona “Aceptar”.
> > - **entonces** el sistema informa el monto final con el 10% de descuento aplicado.
> > 
> > **Escenario 4: Compra cliente**
> > - **Dado** el usuario [kablan@gmail.com](mailto:kablan@gmail.com) que no es premium, la bebida seleccionada “Fernet Branca, precio 2000 pesos y se dispone de stock disponible para la bebidas seleccionadas.
> > - **cuando**  selecciona la bebida “Fernet Branca” con precio de 2000 pesos y presiona “Aceptar”.
> > - **entonces** el sistema informa el monto total(2000 pesos) de los productos seleccionados en pantalla.
> >**Escenario 5: Seleccion fallida por falta de stock**
> > - **Dado** el usuario [abtrapto99@gmail.com](mailto:abtrapto99@gmail.com), selecciona la bebida “Jägermeister” el cual no dispone de stock disponible.
> > - **cuando** selecciona la bebida “Jägermeister” con precio 100000 pesos y presiona “Aceptar”.
> > - **entonces** el sistema informa que no tiene stock disponible para el producto seleccionado.
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
> > - Numero de serie debe ser unico
> > 
> > **Criterios de aceptación (Agregar elementos al kit):**
> > **Escenario 1: El administrador da de alta elemento nacional al kit**
> > - **Dado** un administrador autenticado
> > - **cuando** ingresa el numero de serie único 888, el tipo camara, con precio de compra $500.000, origen argentino y la fecha de alta 02/03/2026,
> > - **entonces** al confirmar los datos el sistema agrega al kit el elemento para ser prestado.
> > 
 >>**Escenario 2: El administrador da de alta elemento importado al kit**
> > - **Dado** un administrador autenticado,
> > - **cuando** ingresa el numero de serie único 888, el tipo camara, con precio de compra $500.000, origen Estadounidense y la fecha de alta 02/03/2026,
> > - **entonces** al confirmar los datos el sistema agrega al kit el elemento para ser prestado y le aplica un impuesto del 10% sobre el precio de compra.
> > 
> >**Escenario 3: El administrador ingresa elemento con numero de serie repetido**
> > - **Dado** un administrador autenticado,
> > - **cuando** ingresa el numero de serie 888,
> > - **entonces** el sistema informa que el sistema el numero de serie ya se encuentra registrado
> > 
> >**Escenario 4: El administrador ingresa un elemento que al aplicar el impuesto supera el  precio de compra maximo ???**
> > - **Dado** un administrador autenticado 
> > - **cuando** ingresa el numero de serie único 888, el tipo camara, con precio de compra $999.000, origen Estadounidense y la fecha de alta 02/03/2026,
> > - **entonces** al confirmar los datos el sistema detecta que al sumarle el 10% supera el 1.000.000 de pesos por lo tanto informa que el precio de compra debe ser menor a 1.000.000
> > 
> >**Escenario 5: El administrador ingresa un elemento con precio de compra mayor a 1 millon**
> > - **Dado** un administrador autenticado 
> > - **cuando** ingresa el numero de serie único 888, el tipo camara, con precio de compra $1.010.000,
> > - **entonces** el sistema le informa que el precio debe ser menor a 1.000.000
# 5 - Manejo de licencias

**Rol de usuarios:**
- Empleado
- Administrativo

**Historias de usuario:**
- Solicitar licencia.
- Registrarse.
- Iniciar sesion.
- Cerrar sesion.
- Consultar licencias solicitadas.

> [!info] FRENTE - ID: Solicitar licencia medica
> **Como** empleado 
> **Quiero** solicitar una licencia medica
> **Para** justificar la inasistencia por motivos de salud propios o de un familiar
> 
> > [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> > - Para poder solicitar una licencia el empleado debe tener más de 1 mes de antigüedad sino se rechaza.
> > - El empleado debe estar registrado y autenticado en el sistema.
> > - podrá solicitar una licencia un empleado que no tenga una licencia vigente.
> > - Para solicitar una licencia debe ingresar el tipo de licencia (presencial o telemedicina), la fecha de inicio de reposo, la matrícula de su médico personal, el diagnóstico y si es para el titular o para un familiar enfermo.
> > - el sistema debe generar un código de licencia y lo envía vía mail a la casilla del empleado con la confirmación de la licencia y los días otorgados.
> > 
> > **Criterios de aceptación (Solicitar una licencia):**
> > **Escenario 1: Empleado solicita licencia exitosamente**
> > - **Dado** un empleado registrado, autenticado en el sistema, sin tener una licencia vigente y antiguedad de mas de 1 mes,
> > - **cuando** solicita una licencia con los datos, tipo de licencia presencial, fecha de inicio de reposo 02/10/2026, matricula del medico personal 1250, por operacion de vista, para el titular y confirma el formulario,
> > - **entonces** el sistema genera un codigo y lo envia al mail del empleado con la confirmacion de la licencia, los dias otorgados y registra la solicitud.
> > 
> > **Escenario 2: Solicitud fallida por antiguedad insuficiente**
> > - **Dado** un empleado registrado, autenticado en el sistema, con una antiguedad de 20 dias,
> > - **cuando** solicita una licencia con los datos, tipo de licencia presencial, fecha de inicio de reposo 02/10/2026, matricula del medico personal 1250Ml, por operacion de vista, para el titular,
> > - **entonces** el sistema detecta que el empleado tiene antiguedad menor de 1 mes y informa el rechazo de la licencia.
> >
> >**Escenario 3: Solicitud fallida por tener licencia activa**
> > - **Dado** un empleado registrado y autenticado en el sistema,
> > - **cuando** selecciona la opcion de solicitar una licencia,
> > - **entonces** el sistema rechaza la accion y informa que no es posible solicitar una licencia teniendo una vigente.
> >
> >**Escenario 4: Solicitud fallida por falta de autenticacion**
> > - **Dado** un usuario que no ha iniciado sesión en el sistema,
> > - **cuando** selecciona la opcion de solicitar una licencia,
> > - **entonces** el sistema deniega la accion y le solicita que inicie sesion.

> [!info] FRENTE - ID: Consultar Licencias Solicitadas
> **Como** administrativo 
> **Quiero** consultar licencias solicitadas
> **Para** obtener un infrome
> 
> > [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> > - Solo se podrá imprimir un informe por mes para cada empleado.
> > - Para consultar una licencia se debe ingresar el cuil del empleado y un rango de fechas
> > 
> > **Criterios de aceptación (Consultar una licencia solicitada):**
> > **Escenario 1: Consulta e impresión exitosa**
> > - **Dado** un empleado con CUIL "20-24521125-2" al cual no se le ha impreso ningún informe durante el mes en curso,
> > - **cuando** llena el campo de cuil del empleado 20-24521125-2, el rango de fecha 20/10/2025 al 02/11/2025 y confirma los datos,
> > - **entonces** el sistema imprime el informe con el detalle de las licencias solicitadas para dicho período..
> > 
> > **Escenario 2: Consulta fallida por límite mensual alcanzado**
> > - **Dado** un administrativo autenticado y un empleado con CUIL "20-24521125-2" que ya registra un informe impreso dentro del mes en curso,
> > - **cuando** llena el campo de Cuil del empleado 20-24521125-2, el rango de fecha 20/10/2025 al 02/11/2025 y confirma los datos,
> > - **entonces** el sistema bloquea la acción e informa que ya se emitió el informe mensual permitido para ese empleado.
> >
> > **Escenario 3: Consulta sin licencias registradas para el rango**
> > - **Dado** un administrativo autenticado y un empleado con CUIL "20-24521125-2" que no registra licencias en el rango de fechas seleccionado y no tiene impresiones este mes,
> > - **cuando** llena el campo de cuil del empleado 20-24521125-2, el rango de fecha 20/10/2025 al 02/11/2025 y confirma los datos,
> > - **entonces** el sistema informa que no existen licencias registradas para el empleado en dicho período y no genera la impresión.
> > 
> >**Escenario 4: Administrador sin iniciar sesión intenta consultar una licencia**
> > - **Dado** un administrador selecciona consultar una licencia,
> > - **cuando** selecciona la opcion de consultar una licencia,
> > - **entonces** el sistema deniega el acceso y solicita el inicie sesion

> [!info] FRENTE - ID: Registrarse
> **Como** persona
> **Quiero** registrarme
> **Para** poder iniciar sesion en el sistema.
> 
> > [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> > - El mail debe ser único.
> > - El Cuil debe ser único.
> > **Criterios de aceptación (Registrarse en el sistema):**
> > **Escenario 1: Registro exitoso**
> > - **Dado** el mail [redesP@gmail.com](mailto:redesP@gmail.com) que no es encuentra registrado y el cuil 20-9999-7 que no se encuentra registrado
> > - **cuando**  se ingresa mail [redesP@gmail.com](mailto:redesP@gmail.com), cuil 20-9999-7, contraseña 4321 y presiona “Registrarse”
> > - **entonces** el sistema valida el registro e informa "Registro exitoso"
> > 
> > **Escenario 2: Registro fallido por mail existente**
> > - **Dado** el mail [juanpablo@gmail.com](mailto:juanpablo@gmail.com) que se encuentra registrado.
> > - **cuando** se ingresa el mail juan[pablo@gmail.com](mailto:pablo29@gmail.com), cuil 20-8888-1, contraseña 1022 y presiona “Registrarse”
> > - **entonces** el sistema bloquea la acción e informa que: “El mail ya se encuentra registrado”.
> >
> > **Escenario 3: Registro fallido por Cuil existente**
> > - **Dado** el cuil 27-4433-1 que se encuentra registrado
> > - **cuando** se ingresa el mail [peter@gmail.com](mailto:peter@gmail.com), cuil 27-4433-1, contraseña 0909 y presiona “Registrarse”.
> > - **entonces** el sistema bloquea la acción e informa que: “El Cuil ya se encuentra registrado”.
> > 
> >**Escenario 4: Administrador sin iniciar sesión intenta consultar una licencia**
> > - **Dado** un administrador selecciona consultar una licencia,
> > - **cuando** selecciona la opcion de consultar una licencia,
> > - **entonces** el sistema deniega el acceso y solicita el inicie sesion
**
# 6- Pago Electrónico
Problema 6: Pago Electrónico Se desea modelar un sistema de pago electrónico de impuestos y servicios en efectivo. Cuando un cliente llega para realizar un pago, el <font color="#00b0f0">empleado</font> o el <font color="#00b0f0">gerente</font> de la sucursal <font color="#ffff00">ingresa el código de pago electrónico y el sistema se conecta con la central de cobro para recuperar los datos de la factura (empresa, nro de cliente, 1era fecha de vencimiento, 2da fecha de vencimiento, recargo, y monto original).</font> Una vez recuperados los datos, <font color="#ffff00">el sistema debe verificar los vencimientos para determinar el monto a cobrar. </font>Teniendo esto en cuenta, <font color="#c00000">cuando el 2do vencimiento está vencido se debe informar que la factura no se puede cobrar por dicho motivo. </font>Cuando el <font color="#c00000">1er vencimiento</font> está vencido hay que aplicar el <font color="#c00000">recargo al monto original</font>. Si la <font color="#c00000">factura no está vencida, se cobra el monto original.</font> Una vez al día, el <font color="#00b0f0">gerente</font> de la sucursal <font color="#ffff00">debe registrar en la central de cobros los pagos que hicieron los clientes. </font>Para esto el sistema <font color="#c00000">requiere la clave maestra y de ser correcta,</font> <font color="#ffff00">recupera las transacciones de los impuestos y servicios cobrados en el día, se conecta a la central de cobro y se las envía. </font>Cuando la central confirma la recepción exitosa, el sistema las registra como enviadas. Este último paso es importante porque <font color="#c00000">no deben enviarse dos veces las transacciones.</font> <font color="#ff0000">Si el gerente intenta enviar una segunda vez, el sistema no debe permitirlo. </font>Finalmente <font color="#ffff00">el Gerente puede ver las estadísticas de los impuestos y servicios cobrados.</font><font color="#ffff00"> Para esto, se ingresa la clave maestra, un rango de fechas sobre las cuales debe calcularse las estadísticas y el sistema debe mostrar los montos y la cantidad de cobros realizados, agrupando por empresa.</font> Tenga en cuenta que cada vez que el sistema debe conectarse a la central, debe enviarle un token (código que identifica al sistema). Una vez que la central valida el token, el sistema envía el requerimiento para recuperar los datos de la factura o el requerimiento para registrar los pagos del día según corresponda.
**Rol de usuarios:**
- empleado.
- gerente.

**Historias de usuario:**
- Pagar factura electrónica.
- Registrar cobros de clientes.
- Ver estadísticas de impuestos y servicios cobrados.

> [!info] FRENTE - ID: Pagar Impuestos/servicios.
> **Como** gerente/empleado
> **Quiero** cargar un pago electronico
> **Para** que el cliente pueda pagarlo.
> 
> > [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> > - Si 2do vencimiento vencido no se puede cobrar.
> > - Toda conexión con la central de cobro requiere el envío y validación previa del token identificador del sistema.
> > - Si 1er vencimiento vencido aplicar recargo al monto original.
> > - Si no esta vencido cobrar monto original.
> > - Solo en Efectivo.
> > - Los datos provistos por la central para cada factura son: empresa, número de cliente, primera fecha de vencimiento, segunda fecha de vencimiento, recargo y monto original.
> > 
> > **Criterios de aceptación (Pagar factura electronica):**
> > **Escenario 1:  Pago de factura exitoso sin vencimiento** 
> > - **Dado** un cliente con una factura electronica,
> > - **cuando** cuando el empleado/gerente ingresa el codigo de pago electronico, el sistema recupera los datos de la factura,
> > - **entonces** el sistema verifica que la factura no esta vencida y al detectar que no lo esta, muestra el monto original a pagar por el cliente.
> > 
> > **Escenario 2: Pago de factura exitoso con 1er vencimiento
> > - **Dado** un cliente con una factura electronica,
> > - **cuando** el empeado/gerente ingresa el codigo del pago electronico, el sistema recupera los datos de la factura,
> > - **entonces** el sistema verifica que la factura no este vencida, este detecta que el 1er venciminto lo esta y aplica un recargo al monto original a pagar por el cliente
> > **Escenario 3: Pago de factura 2do con vencimiento
> > - **Dado** un cliente con una factura electronica,
> > - **cuando** el empeado/gerente ingresa el codigo del pago electronico, el sistema recupera los datos de la factura,
> > - **entonces** el sistema verifica que la factura no este vencida, este detecta que el 2do vencimiento lo esta y informa en pantalla que no es posible cobrar por estar vencida.
> >  **Escenario 3: Intento de pago de factura paga
> > - **Dado** un cliente con una factura electronica,
> > - **cuando** el empeado/gerente ingresa el codigo del pago electronico, el sistema recupera los datos de la factura,
> > - **entonces** el sistema verifica que la factura no este vencida y detecta que esta paga.

> [!info] FRENTE - ID: Registrar cobros de los clientes.
> **Como** gerente
> **Quiero** registrar en la central de cobros los pagos que hicieron los clientes
> **Para** que quede registrado los cobros de los clientes.
> 
> > [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> > - Requiere la clave maestra.
> > - No deben enviarse dos veces las transacciones.
> > - Si el gerente intenta enviar una segunda vez, el sistema no debe permitirlo.
> > **Criterios de aceptación (Registrar cobros de los clientes):**
> > **Escenario 1:  Registro de pagos de clientes en la central exitoso** 
> > - **Dado** que el gerente ingresa la clave maestra al sistema correctamente, el sistema recupera las transacciones de impuestos y servicios del dia,
> > - **cuando** el sistema se conecta a la central de cobros, detecta que en el día no fueron enviadas las transferencias,
> > - **entonces**  las envía, recibe por la central que la recepcion fue exitosa y registra como enviadas para no poder ser enviadas de nuevo.
> > **Escenario 2:  Ingreso de clave incorrecta** 
> > - **Dado** que el gerente quiere registrar las transacciones del dia,
> > - **cuando** ingresa la clave maestra "1234", 
> > - **entonces** el sistema informa que es incorrecta y bloquea la accion.
> > **Escenario 3:  Central no confirma la recepcion**
> > - **Dado** que el gerente ingresa la clave maestra al sistema correctamente, el sistema recupera las transacciones de impuestos y servicios del dia,
> > - **cuando** el sistema se conecta a la central de cobros, detecta que en el día no fueron enviadas las transferencias,
> > - **entonces**  las envía, recibe por la central que la recepcion fue fallida y lo informa en pantalla y pide que se intente nuevamente.
> > 

> [!info] FRENTE - ID: Ver estadisticas de cobros.
> **Como** gerente
> **Quiero** ver estadística de los impuestos y servicios cobrados
> **Para** analizar esos datos.
> 
>> [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> > **REGLAS DE NEGOCIO:**
> > - Clave maestra.
> > - Rango de fechas.
> > - Agrupar por empresa montos y cantidad de cobros realizados.
> > **Criterios de aceptación (Ver estadisticas de cobros):**
> > **Escenario 1:  Vista de estadisticas exitosa** 
>> - **Dado** que el gerente ingreso la clave maestra correctamente
> > - **cuando** ingresa un rango de fechas,
> > - **entonces**  el sistema muestra los montos y cantidad de cobros realizados por empresa.
> > **Escenario 2:  Ingreso de clave incorrecta** 
> > - **Dado** que el gerente quiere registrar las transacciones del dia,
> > - **cuando** ingresa la clave maestra "1234", 
> > - **entonces** el sistema informa que es incorrecta y bloquea la accion.
> > **Escenario 3:  Central no confirma la recepcion**
> > - **Dado** que el gerente ingresa la clave maestra al sistema correctamente, el sistema recupera las transacciones de impuestos y servicios del dia,
> > - **cuando** el sistema se conecta a la central de cobros, detecta que en el día no fueron enviadas las transferencias,
> > - **entonces**  las envía, recibe por la central que la recepcion fue fallida y lo informa en pantalla y pide que se intente nuevamente.
**Rol de usuarios:**

# (PLANTILLA)[Número del Ejercicio] - [Título del Sistema/Módulo]

**Rol de usuarios:**
- Abogado

**Historias de usuario:**
- Iniciar sesion
- cerrar sesion
- registrarse
- sacar turno 
- cancelar turno
---
Frente
ID: Registrarse en sistema
titulo: como profesional ed derecho quiero registrar mis datos para poder acceder al sistema.
Reglas Del negocio:
- Solo profesionales de derecho Matriculados habilitados
- Matriculado en la provincia de bs as
- Antiguedad superior a 5 años

---
Dorso
Criterios de aceptacion (Registro en el sistema):
Escenario 1: Registro exitoso.
Dado un profesional de derecho con matricula 52332 habilitada, matriculado en la provincia de bsas y fecha de matriculacion con antiguedad superior a 5 años,
Cuando ingresa nombre 'Manuel', apellido 'Perez', Matricula '52332', Provincia de matriculacion 'Buenos aires', fecha de nacimiento '3-10-2000', direccion de correo electronico 'manuperez@gmail.com' y fecha de matriculacion "02/10/2019".
Entonces el sistema valida la fecha de matriculacion, que es profesional de derecho habilitado, la provincia de matriculacion y envia al mail ingresado una contrasenia 
Escenario 2: Registro fallido por matriculacion en provincia de chubut
dado un profesional de derecho con matricula habilitada, matriculado en la provincia de chubut, fecha de matriculacion con antiguedad superior a 5 anios,
cuando ingresa el nombre "daniel", apellido "rodriguez", Matricula "2424", provincia de matriculacion chubut, fecha de nacimiento 3/10/2000, direccion de correo electronico danielrodri@gmail.com y fecha de matriculacion 23/02/2010, cuando aprieta en confirmar datos
entonces el sistema bloquea la accion por matriculacion fuera de la provincia de buenos aires, informandolo en pantalla 'Registro fallido, Solo los profesionales de derecho matriculados en buenos aires pueden registrarse'
Escenario 3: Registro fallido por matricula Inhabilitada
Escenario 4: Registro fallido por antiguedad inferior a 5 anios
Escenario 5: Registro fallido por email registrado.
Escenario 6: registros falido por matricula registrada.

---
Frente
ID: Inicio de sesion
Titulo: como profesional de derecho registrado en el sistema quiero iniciar sesion para poder solicitar un turno.
Reglas del negocio:
- Suspencion por 3 intentos consecutivos de inicio de sesion fallidos
- Primer inicio debe cambiarse contrasenia
- Una cuenta suspendida solo se reactiva luego de ser revisada por el área de seguridad del colegio.
---
Dorso:
Criterios de aceptacion (Inicio de sesion):
Escenario 1: Inicio de sesion exitoso.
dado un profesional registrado que no es su primer inicio de sesion,
cuando ingresa el nombre de usuario que es su matricula "2234" y contrasenia "Lp231" y apreta en el boton "Iniciar sesion".
Entonces el sistema verifica que el usuario este registrado y que la contrasenia coincida con el nombre de usuario y ingresa a la pagina inicial del sistema.
Escenario 2: Inicio de sesion exitoso primera vez
dado un profesional registrado que es su primer inicio de sesion, cuando ingresa el nombre de usuario "21234" y contrasenia brindada por el sistema "Lka1241as" y aprieta iniciar sesion
entonces el sistema valida que el usuario y contrasenia esten registrados y pide al usuario que cambie la contrasenia.
Escenario 3: Inicio de sesion fallido por contrasenia incorrecta menor a cantidad de intentos
dado un profesional registrado con nombre de usuario "22321" y contrasenia "Lsa12",
cuando ingresa los datos y presiona el boton iniciar sesion,
Entonces el sistema verifique que el usuario y contrasenia esten registrados, detecta que la contrasenia es incorrecta e informa al usuario que el usuario/contrasenia es incorrecta y cantidad de intentos restantes.
Escenario 4: Inicio de sesion fallido por usuario incorrecto menor a cantidad maxima
Escenario 5: Inicio de sesion fallido y suspendendo cuenta por superar la cantidad de intentos maximas.
Escenario 6: Inicio de sesion fallido por usuario no registrado.
Escenario 7: Inicio de sesion fallido por intento de inicio de sesion a cuenta suspendida

---
frente
Id: cerrar sesion
Titulo: Como usuario quiero cerrar sesion para abandonar el sistema.
Reglas del negocio:
dorso
criterios de aceptacion
Escenario 1: Cierre de sesion exitoso
dado un usuario con sesion iniciada, 
cuando presiona en el boton de cerrar sesion
entonces el sistema cierra sesion y pide que inicie sesion.

---
Frente 
ID: Solicitar turno
Titulo: como profesional de derecho quiero solicitar un turno para realizar una mediacion.
Reglas del negocio:
- Cada sala posee una capacidad maxima de asistentes.
- Si supera capacidad base de asistentes requiere contratacion de un seguro adicional
---
Dorso
Criterios de aceptacion(Solicitar turno):
Escenario 1:  Reserva exitosa
dado un usuario registrado que indica un numero de sala "4" valida para la fecha "25/09/26", con cantidad de asistentes "4" menor a la capacidad maxima "7" y base "5",
cuando ingresa numero de sala "4", cantidad de asistentes "4", fecha del turno 25/09/26 y tipo de actividad "mediacion". Cuando presiona le boton solicitar,
entonces el sistema valida que la capacidad de asistentes es menor o igual a la base sala y que tiene disponibilidad para esa fecha. Registra la reserva y genera un codigo de reserva y envia la correo electronico del profesional conla confirmacion del registro.
Escenario 2: Reserva exitosa capacidad base
dado un usuario regisdtrado que indica numero de sala "5" valida para fecha "24/10/26"



Roles
- Pacientes
- Profesionales
Historias de usuario
- solicitar un turno
- ver turnos

### Frente
---
#### ID: 
Solicitar un turno
#### Titulo: 
Como Paciente Quiero solicitar un turno Para atenderme con un medico
#### Reglas de negocio: 
- Solo un turno por especialidad por semana
- Ser mayor a 18 años.
--- 

### Dorso
---
Criterios de aceptacion:

Escenario 1: Solicitar un turno exitosamente
dado un paciente registrado, autenticado y sin turno de la especialidad (dermatologia) en la semana del dia 25/09 y mayor de edad,
cuando el paciente selecciona la especialidad (Dermatologia), el medico (jorge burruchaga), dia 25 a las 10 am y confirma los datos del turno.
entonces el sistema verifica que el paciente esta registrado, autenticado, sin turno para la especialidad en esa semana, que es mayor de edad y que el medico tiene el turno disponible, Guarda el turno en el sistema y muestra comprobante del turno.

Escenario 2: Solicitar turno fallido por menor de 18 años
dado un paciente registrado, autenticado, sin turno de la especialidad (oftalmologia) en la semana del dia 4 a las 10 y Menor de edad
Cuando el paciente selecciona la especialidad oftalmologia, medico nora lopez, dia 4 a las 
10, y presiona en confirmar turno.
entonces el sistema bloquea la accion e informa en pantalla "No fue posible solicitar el turno, los turnos deben ser solicitados por personas mayores a 18 años".

Escenario 3: Solicitar turno fallido por tener un turno de esa especialidad esa semana.
dado un paciente registrado, autenticado y con un turno para la especialidad dermatologia en la semana del dia 3 a las 14 horas. 
cuando el paciente selecciona la especialidad dermatologia, medico raul perez y el dia 3 a las 14 horas.
entonces el sistema bloquea la accion y informa en pantalla "No fue posible solicitar el turno, solo se permite un turno por especialidad por semana."

Escenario 4: Solicitar turno fallido por dia y horario seleccionado no disponible
dado un paciente registrado, autenticado, sin turno de la especialidad (oftalmologica) en la semana del dia 29 a las 4.
Cuando el paciente selecciona la especialidad obstetricia, medico laura chiesa, el dia 29 a las 4 y presiona el boton confirmar turno.
entonces el sistema bloquea la accion e informa en pantalla "No fue posible solicitar el turno, el dia y hora del turno seleccionados no se encuentra disponible"

---
### Frente
#### ID: 
Ver turnos
#### Titulo: 
como medico registrado quiero ver los turnos del dia 09 para organizar mi dia.
#### Reglas del negocio:
- Solo fechas del corriente año

### Dorso
#### Criterios de aceptacion:
**Escenario 1:** Ver turnos exitosamente.
Dado un medico registrado, autenticado, queriendo ver turnos de una fecha de este año
cuando el medico selecciona la fecha 24/09/2026 y presiona en ver turnos
entonces el sistema lista en pantalla todos los turnos activos para esa fecha.
**Escenario 2:** Ver turnos fallido por ingresar fecha de otro año.
Dado un medico registrado, autenticado queriendo ver turnos de una fecha del año pasado
cuando el medico ingresa la fecha 25/09/2025 y presiona ver turnos
el sistema bloquea la accion e informa en pantalla "No es posible mostrar turnos en esa fecha. Por favor ingrese una fecha del año corriente"
**Escenario 3:** Ver turnos exitoso sin turnos activos
Dado un medico registrado, autenticado, queriendo ver turnos de la fecha 25/09/26
cuano el medico ingresa la fecha 25/09/26 y presiona ver turnos.
entonces el sistema informa en pantalla "No no hay turnos activos para la fecha ingresada"

# Parcial 1ra fecha 4/10/2025 Gimnasios 
#### Roles de usuario:
- Socios
- Administradores
#### Historias de usuarios:
- Solicitar un turno
- Cancelar un Turno
- Crear clase
### Frente
---
#### ID: 
Solicitar un turno
#### Titulo:
Como socio queiro reservar un turno para una clase de mi gimnasio
#### Reglas del Negocio:
- Se le informa al socio cuando no se concreta la reserva.
- Debe tener la cuota al dia.

### Dorso
---
#### Criterios de aceptacion: 

**Escenario 1:** Solicitud de turno exitosa
Dado un socio autenticado, con la cuota al dia,
cuando el socio ingresa el nombre de gimnasio "Irongym", selecciona el tipo de clase "Yoga", dia "02" y hora "15:30" y presiona confirmar turno,
entonces el sistema valida que el socio tenga la cuota al dia y hay cupo para los datos ingresados e informa en pantalla "Turno solicitado exitosamente"
**Escenario 2:** Solicitud invalida por no tener cuota al dia.
dado un socio autenticado, con cuota impaga,
cuando el socio ingresa el nombre de gimnasio "Megatlon", selecciona el tipo de clase "Spinning", dia "03" y hora "14:00" y presiona confirmar turno, 
entonces el sistema bloquea la accion por tener la cuota impaga e informa en pantalla "No fue posible completar la solicitud del turno por cuota impaga. Por favor pague la cuota y solicite nuevamente el turno"
**Escenario 3:** Solicitud invalida por falta de cupo en clase, dia y hora seleccionada.
Dado un socio autenticado con la cuota paga quiere solicitar turno en clase sin cupo,
Cuando el socio ingresa el nombre de gimnasio "Red Fitness", selecciona el tipo de clase "Funcional", dia "05", hora "9:00" y presiona confirmar turno, 
Entonces el sistema detecta que la clase ya completo su cupo maximo e informa en pantalla "No fue posible solicitar el turno, la clase seleccionada para ese dia y hora esta completa. Por favor seleccione otro turno".
**Escenario 4:** Solicitud fallida por turno ya existente en clase, dia y hora seleccionado
Dado un socio autenticado con la cuota paga y una clase con un turno activo,
cuando el socio ingresa el nombre de gimnasio "!Be", selecciona el tipo de clase "Running", para el dia "03" y hora "13" y presiona confirmar turno
entonces el sistema detecta que el socio ya tiene un turno reservado para los datos ingresados y bloquea la accion e informa en pantalla "No fue posible completar la solicitud del turno, ya tiene un turno activo".



---
### Frente
#### ID: 
Cancelar turno
#### Titulo:
Como usuario Quiero cancelar un turno Para liberar cupo
#### Reglas de negocio:
- se debe informar el resultado de la cancelacion
- Se puede cancelar hasta una hora antes del comienzo de la clase
---
### Dorso
#### Criterios de aceptacion:

**Escenario 1:** Cancelacion exitosa
dado un socio autenticado, con tiempo restante de inicio de la clase mayor a una hora y con un turno activo,
cuando el socio ingresa dia "03" y hora "12:00" y presiona cancelar turno
entonces el sistema cancela el turno exitosamente e informa en pantalla "Cancelado exitosamente", 

**Escenario 2:** Cancelacion fallida tiempo restante de comienzo de la clase menor a 1 hora
dado un socio autenticado, con tiempo restante de inicio de la clase menor a una hora y con un turno activo,
cuando el socio ingresa el dia "02" y hora "15:00" y presiona cancelar turno,
entonces el sistmea bloquea la accion e informa en pantalla "No es posible cancelar el turno, por tiempo de inicio de clase menor a una hora".

**Escenario 3:** Cancelacion fallida por no tener un turno.
dado un socio autenticado, sin ninguna solicitud de turno para fecha ingresada.
cuando el socio ingresa el dia "12" hora "15:30" y presiona cancelar turno,
entonces el sistema bloquea la accion e informa en pantalla "No fue posible cancelar el turno, no tienes ningun turno para el dia y hora ingresada"

---
### Frente
#### ID: 
Crear clase
#### Titulo:
Como administrador quiero crear una clase para que mis alumnos se puedan anotar
#### Reglas del negocio:
- En cada sala solo una clase a la vez
- Cada instructor maximo tres clases por dia

---
### Dorso
#### Criterios de aceptacion:
**Escenario 1:** Creacion de clase exitosa
dado un administrador autenticado en el sistema, con una sala con disponibilidad y instructor con 2 clases asignadas para ese dia
Cuando el administrador ingresa el nombre de sede "!BE", tipo de clase "Spinning", numero de sala "4", dni "42521251", capacidad maxima "12", dia "12", hora "12:30" y presiona el boton crear clase,
entonces el sistema crea la clase e informa en pantalla "Clase creada exitosamente".
**Escenario 2:** Creacion de clase fallida por Instructor asignado con clases asignadas maxima para un dia
dado un administrador autenticado, con una sala disponible y instructor con 3 clases asignadas para ese dia
cuando el administrador ingresa el nombre de sede "Red fitness", tipo de clase "Funcional", numero de sala "12", Dni "24101124", capacidad maxima "21", dia "25", hora "15:00" y presiona el boton crear clase,
entonces el sistema bloquea la accion y informa en pantalla "No fue posible la creacion de la clase por intructor con cantidad de clases maxima para ese dia"
**Escenario 3:** Creacion de clase fallida por clase existente
dado un administrador autenticado, con una sala disponible y instructor disponible para el dia "3",
cuando el administrador ingresa el nombre de sede "Iron", tipo "musculacion", numero de sala "3", dni "34235234", capacidad maxima "24", dia "1", hora "15:00" y presiona el boton crear clase
entonces el sistema bloquea la accion e informa "No fue posible la creacion de la clase, la clase ingresada ya existe"
**Escenario 4:** Creacion de clase fallida por sala ocupada
dado un administrador autenticado, con sala seleccionada ocupada, instructor "43221555" disponible para el dia "5",
cuando el administrador ingresa el nombre de sede "Iron", tipo "Spinning", numero de sala "5", dni "45123123", capacidad maxima "11", dia "5", hora "9:00" y presioona el boton crear clase,
entonces el sistema bloquea la accion e informa en pantalla "l"
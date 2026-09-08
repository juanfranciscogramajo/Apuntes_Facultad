# Práctica 2 — Historias de Usuario (respuestas en limpio)

Solo las tarjetas finales correctas, listas para repasar/memorizar. El detalle de errores, dudas y correcciones está en `Practica-2-Notas.md`.

## Problema 1 — Alquiler de mobiliario

**Roles:** Cliente, Encargado de mobiliario.
**Historias identificadas:** Dar de alta mobiliario, Hacer reserva (Reservar muebles), Pagar con tarjeta.

### HU: Dar de alta mobiliario
- **ID:** Dar de alta mobiliario
- **Título:** Como encargado de mobiliario quiero dar de alta un mueble para poder ofrecerlo en alquiler.
- **Reglas de negocio:** No pueden existir códigos de inventario repetidos.
- **Criterios de aceptación:**
  - **Escenario 1: Alta de mueble exitosa.**
    Dado un encargado de mobiliario autenticado con éxito y el código de inventario 2 no registrado previamente,
    Cuando ingresa el número de inventario 2, tipo de mueble algarrobo, fecha de creación 12/12/2024, fecha de último mantenimiento 12/12/2025, estado libre y precio 25.000, y presiona "Dar de alta mueble",
    Entonces el sistema da de alta el mueble e informa "Mueble agregado correctamente".
  - **Escenario 2: Alta fallida por código de inventario repetido.**
    Dado un encargado de mobiliario autenticado con éxito y el código de inventario 2 ya registrado en el sistema,
    Cuando ingresa los mismos datos y presiona "Dar de alta mueble",
    Entonces el sistema no da de alta el mueble y muestra el mensaje "El código de inventario 2 ya se encuentra registrado en el sistema".

### HU: Reservar alquiler
- **ID:** Reservar muebles
- **Título:** Como cliente quiero realizar una reserva de alquiler para poder darle uso en un evento.
- **Reglas de negocio:**
  - Una reserva debe incluir como mínimo 3 muebles.
  - Para realizar una reserva se debe abonar el 20% del total del alquiler.
- **Criterios de aceptación:**
  - **Escenario 1: Reserva exitosa.**
    Dado un cliente (Nicolás Guzzo) y los muebles sillas de madera, mesas de madera y estantes de madera disponibles para alquilar,
    Cuando Nicolás Guzzo selecciona la fecha 12/12/2003, el lugar salón privado Rivadavia, cantidad de días 2, 3 sillas de madera, 15 mesas de madera y 2 estantes de madera, y presiona "Realizar reserva",
    Entonces el sistema calcula el 20% del monto total, lo informa y redirige al usuario para realizar el pago.
  - **Escenario 2: Reserva fallida por falta de mobiliario mínimo.**
    Dado un cliente (Nicolás Guzzo) y los muebles sillas de madera, mesas de madera y estantes de madera disponibles para alquilar,
    Cuando Nicolás Guzzo selecciona la fecha 12/12/2003, el lugar salón privado Rivadavia, cantidad de días 2, 1 silla de madera y 1 mesa de madera, y presiona "Realizar reserva",
    Entonces el sistema no realiza la reserva y muestra el mensaje "La reserva puede realizarse con al menos 3 muebles seleccionados".
  - **Escenario 3: Reserva fallida por falta de disponibilidad.**
    Dado un cliente (Nicolás Guzzo) y los muebles sillas de madera y mesas de madera disponibles, y estantes de madera no disponibles para alquilar,
    Cuando Nicolás Guzzo selecciona la fecha 12/12/2003, el lugar salón privado Rivadavia, cantidad de días 2, 3 sillas de madera, 15 mesas de madera y 2 estantes de madera, y presiona "Realizar reserva",
    Entonces el sistema no realiza la reserva y muestra el mensaje "Los estantes de madera no están disponibles para ser alquilados".

### HU: Pagar con tarjeta
- **ID:** Realizar Pago
- **Título:** Como cliente quiero realizar un pago para poder confirmar un alquiler de mobiliario.
- **Reglas de negocio:** Solo se puede abonar con tarjeta de crédito.
- **Criterios de aceptación:**
  - **Escenario 1: Pago exitoso.**
    Dado el número de tarjeta de crédito 123456 con fondos suficientes y conexión con el servidor del banco exitosa,
    Cuando el cliente Nicolás Guzzo ingresa el número de tarjeta 123456 y presiona "Realizar pago",
    Entonces el sistema confirma el alquiler de mobiliario correctamente, genera un número de reserva único (323232) e informa "Pago exitoso, su código de reserva único es 323232".
  - **Escenario 2: Pago rechazado por fondos insuficientes.**
    Dado el número de tarjeta de crédito 123456 con fondos insuficientes y conexión con el servidor del banco exitosa,
    Cuando el cliente Nicolás Guzzo ingresa el número de tarjeta 123456 y presiona "Realizar pago",
    Entonces el sistema no confirma el alquiler de mobiliario y da aviso de "El pago fue rechazado por saldo insuficiente".
  - **Escenario 3: Pago rechazado por falta de conexión con el servidor del banco.**
    Dado el número de tarjeta de crédito 123456 con fondos suficientes y conexión con el servidor del banco fallida,
    Cuando el cliente Nicolás Guzzo ingresa el número de tarjeta 123456 y presiona "Realizar pago",
    Entonces el sistema no confirma el alquiler de mobiliario y da aviso de "El pago fue rechazado por falta de conexión con el servidor del banco".


## Problema 2 — Cadena hotelera

### HU: Reservar hospedaje
- **ID:** Realizar reserva
- **Título:** Como usuario quiero realizar una reserva de hospedaje para poder alojarme.
- **Reglas de negocio:**
  - La fecha de ingreso no puede exceder los 90 días a partir de la fecha actual. *(⚠️ ambigüedad del enunciado — ver duda anotada en Practica-2-Notas.md, pendiente de consulta al docente)*
  - La duración de la estadía no puede ser mayor a 15 días.
- **Criterios de aceptación:**
  - **Escenario 1: Reserva realizada con éxito.**
    Dada la fecha actual 1/1/2026 y un usuario con credenciales válidas en el sistema que quiere realizar una reserva con fecha de ingreso 5/1/2026 y fecha de egreso 15/1/2026,
    Cuando el usuario ingresa fecha de ingreso 5/1/2026, fecha de egreso 15/1/2026, hotel "Maravilla" y cantidad de personas 3, y presiona "Confirmar reserva",
    Entonces el sistema corrobora que la petición de reserva cumple los requisitos, envía un correo electrónico con el código de reserva y un enlace para continuar con el pago.
  - **Escenario 2: Reserva fallida por fecha de ingreso a más de 90 días de la fecha actual.**
    Dada la fecha actual 1/1/2026, un usuario con credenciales válidas desea realizar una reserva para la fecha de ingreso 15/4/2026,
    Cuando ingresa la fecha de ingreso 15/4/2026 y fecha de egreso 20/4/2026,
    Entonces el sistema no puede registrar la reserva correctamente por exceder los 90 días entre la fecha de ingreso y la fecha actual, y muestra el mensaje "La reserva no pudo ser registrada, la fecha de ingreso excede los 90 días desde la fecha actual".
  - **Escenario 3: Reserva fallida por exceder los 15 días de estadía.**
    Dada la fecha actual 1/1/2026, un usuario "Nicolás" con credenciales válidas en el sistema, una fecha de ingreso 2/1/2026 y una fecha de egreso máxima para esa fecha de ingreso de 17/1/2026,
    Cuando el usuario ingresa la fecha de ingreso 2/1/2026 y fecha de egreso 21/1/2026,
    Entonces el sistema no puede registrar el pedido de reserva al no cumplir los 15 días máximo de estadía, devolviendo el mensaje "La reserva no debe exceder los 15 días".

### HU: Check-in
- **ID:** Realizar check-in
- **Título:** Como usuario quiero realizar el check-in para poder alojarme en el hotel.
- **Reglas de negocio:** Los check-in solo pueden realizarse entre las 10:00 y las 23:59. *(⚠️ ver duda anotada en Practica-2-Notas.md sobre si corresponde exigir autenticación en esta HU)*
- **Criterios de aceptación:**
  - **Escenario 1: Check-in exitoso.**
    Dado el código de reserva 2345 correspondiente a una reserva válida para la fecha actual, siendo las 14:00 (dentro del horario permitido),
    Cuando el usuario ingresa el código de reserva 2345 y presiona "Realizar check-in",
    Entonces el sistema informa la habitación asignada "3B", envía un mensaje al conserje Jorge con el pedido de guiar al huésped hasta la habitación, y otro mensaje a los botones para que se hagan cargo de las valijas.
  - **Escenario 2: Check-in fallido por fecha de ingreso diferente a la fecha actual.**
    Dado el código de reserva 2345 correspondiente a una reserva no válida para la fecha actual (fecha de ingreso distinta a la fecha actual), siendo las 14:00 (dentro del horario permitido),
    Cuando el usuario ingresa el código de reserva 2345 y presiona "Realizar check-in",
    Entonces el sistema no registra el check-in al validar la diferencia entre la fecha actual y la fecha de ingreso de la reserva correspondiente al código de reserva, e informa en pantalla "Check-in fallido, la fecha correspondiente al código de reserva ingresado no corresponde a la fecha actual".
  - **Escenario 3: Check-in fallido por estar fuera de horario.**
    Dado el código de reserva 2345 correspondiente a una reserva válida para la fecha actual, siendo las 09:00 (fuera del horario permitido),
    Cuando el usuario ingresa el código de reserva 2345 y presiona "Realizar check-in",
    Entonces el sistema no registra el check-in al validar que la hora actual está fuera del rango horario permitido (10:00-23:59), e informa en pantalla "Check-in fallido, el horario permitido para realizar check-in es 10:00-23:59".


### HU: Realizar check-out
- **ID:** Realizar check-out
- **Título:** Como conserje quiero realizar un check-out para poder liberar una habitación previamente reservada.
- **Reglas de negocio:** Solo se puede realizar el check-out de habitaciones sin gastos pendientes.
- **Criterios de aceptación:**
  - **Escenario 1: Check-out exitoso.**
    Dado un conserje (Jorge) y el número de habitación 12 sin gastos pendientes,
    Cuando Jorge ingresa en el sistema el número de habitación 12 y presiona "Confirmar check-out",
    Entonces el sistema registra correctamente el check-out, muestra en pantalla "Check-out completado" y envía a las mucamas del hotel el mensaje "Habitación 12 habilitada para limpieza".
  - **Escenario 2: Check-out fallido por gastos pendientes.**
    Dado un conserje (Jorge) y el número de habitación 12 con gastos pendientes,
    Cuando Jorge ingresa en el sistema el número de habitación 12 y presiona "Confirmar check-out",
    Entonces el sistema no registra el check-out e informa a Jorge "El check-out no puede realizarse hasta que no se abonen los gastos realizados".


## Problema 3 — Venta de bebidas

### HU: Registrar persona
- **ID:** Registrar en sitio web
- **Título:** Como persona quiero registrarme en el sitio web para poder comprar bebidas alcohólicas.
- **Reglas de negocio:**
  - La persona debe ser mayor de edad.
  - El mail ingresado debe ser único.
- **Criterios de aceptación:**
  - **Escenario 1: Registro exitoso.**
    Dada una persona con nombre y apellido Nicolás Guzzo, mail único nicolas.guzzo@gmail.com y edad 23 años,
    Cuando Nicolás Guzzo ingresa nombre: Nicolás, apellido: Guzzo, mail: nicolas.guzzo@gmail.com, edad: 23, y presiona "Confirmar registro",
    Entonces el sistema realiza el registro correctamente, genera una contraseña que envía al mail nicolas.guzzo@gmail.com, y muestra en pantalla el mensaje "Usuario creado correctamente, revise su casilla de correo para finalizar el registro".
  - **Escenario 2: Registro fallido por ser menor de edad.**
    Dada una persona con nombre y apellido Nicolás Guzzo, mail único nicolas.guzzo@gmail.com y edad 17 años,
    Cuando Nicolás Guzzo ingresa nombre: Nicolás, apellido: Guzzo, mail: nicolas.guzzo@gmail.com, edad: 17, y presiona "Confirmar registro",
    Entonces el sistema no finaliza el registro por no cumplir la mayoría de edad, mostrando en pantalla el texto de la ley que impide la venta de bebidas alcohólicas a menores de edad.
  - **Escenario 3: Registro fallido por mail ya registrado.**
    Dada una persona con nombre y apellido Nicolás Guzzo, mail ya registrado nicolas.guzzo@gmail.com y edad 23 años,
    Cuando Nicolás Guzzo ingresa nombre: Nicolás, apellido: Guzzo, mail: nicolas.guzzo@gmail.com, edad: 23, y presiona "Confirmar registro",
    Entonces el sistema no finaliza el registro porque el mail ingresado ya se encuentra registrado, mostrando en pantalla el mensaje "El mail utilizado ya se encuentra registrado en el sitio".


### HU: Iniciar sesión
- **ID:** Iniciar sesión
- **Título:** Como usuario quiero iniciar sesión para poder comprar bebidas alcohólicas en el sitio web.
- **Reglas de negocio:** No hay. *(⚠️ ver duda anotada en Practica-2-Notas.md sobre si esta HU debería en cambio ser una precondición de "Comprar bebidas")*
- **Criterios de aceptación:**
  - **Escenario 1: Inicio de sesión exitoso.**
    Dada una persona, un nombre de usuario existente "nicolas.guzzo" y una contraseña correspondiente al usuario dado "asd123",
    Cuando la persona ingresa el usuario "nicolas.guzzo" y la contraseña "asd123",
    Entonces el sistema valida la sesión correctamente, informa al usuario "Sesión iniciada correctamente" y lo redirige a la página principal del sitio.
  - **Escenario 2: Inicio de sesión fallido por usuario inexistente.**
    Dada una persona y un nombre de usuario inexistente "nicolas.guzzo",
    Cuando la persona ingresa el usuario "nicolas.guzzo" y la contraseña "asd123",
    Entonces el sistema no puede validar la sesión al no encontrar un usuario con esas credenciales, informando en pantalla "Usuario inexistente".
  - **Escenario 3: Inicio de sesión fallido por contraseña incorrecta.**
    Dada una persona, un nombre de usuario válido "nicolas.guzzo" y una contraseña válida para ese usuario "asd123",
    Cuando la persona ingresa el nombre de usuario "nicolas.guzzo" y la contraseña "asd213",
    Entonces el sistema no puede validar el inicio de sesión porque la contraseña no coincide con la correcta para el usuario ingresado, informando en pantalla "Credenciales inválidas".


### HU: Realizar compra
- **ID:** Hacer compra
- **Título:** Como usuario quiero realizar una compra en el sitio para adquirir bebidas alcohólicas.
- **Reglas de negocio:**
  - Si el monto total de la compra supera los $4.500, se aplica un descuento del 10%.
  - Si el usuario es premium, se aplica un descuento del 20%.
- **Criterios de aceptación:**
  - **Escenario 1: Compra exitosa para usuario premium con monto total superior a $4.500.**
    Dado un usuario premium (Nicolás Guzzo) previamente logueado con éxito, y los productos Fernet ($1.500), Gancia ($2.000), Vermú ($5.000) y Ruttini ($2.500),
    Cuando el usuario selecciona Fernet, Gancia y Ruttini (monto total $6.000, superior a $4.500) y presiona "Confirmar compra",
    Entonces el sistema valida la compra correctamente, aplica ambos descuentos (20% por ser premium y 10% por superar los $4.500), y muestra en pantalla el mensaje de compra exitosa con el monto total con ambos descuentos aplicados.
  - **Escenario 2: Compra exitosa para usuario premium con monto total inferior a $4.500.**
    Dado un usuario premium (Nicolás Guzzo) previamente logueado con éxito, y los productos Fernet ($1.500), Gancia ($2.000), Vermú ($5.000) y Ruttini ($2.500),
    Cuando el usuario selecciona Fernet y Gancia (monto total $3.500, inferior a $4.500) y presiona "Confirmar compra",
    Entonces el sistema valida la compra correctamente, aplica únicamente el descuento del 20% por ser premium, y muestra en pantalla el mensaje de compra exitosa con el monto total con ese descuento aplicado.
  - **Escenario 3: Compra exitosa para usuario no premium con monto total superior a $4.500.**
    Dado un usuario no premium (Nicolás Guzzo) previamente logueado con éxito, y los productos Fernet ($1.500), Gancia ($2.000), Vermú ($5.000) y Ruttini ($2.500),
    Cuando el usuario selecciona Fernet, Gancia y Ruttini (monto total $6.000, superior a $4.500) y presiona "Confirmar compra",
    Entonces el sistema valida la compra correctamente, aplica únicamente el descuento del 10% por superar los $4.500, y muestra en pantalla el mensaje de compra exitosa con el monto total con ese descuento aplicado.
  - **Escenario 4: Compra exitosa para usuario no premium con monto total inferior a $4.500.**
    Dado un usuario no premium (Nicolás Guzzo) previamente logueado con éxito, y los productos Fernet ($1.500), Gancia ($2.000), Vermú ($5.000) y Ruttini ($2.500),
    Cuando el usuario selecciona Fernet y Gancia (monto total $3.500, inferior a $4.500) y presiona "Confirmar compra",
    Entonces el sistema valida la compra correctamente, no aplica ningún descuento, y muestra en pantalla el mensaje de compra exitosa con el monto total sin descuentos.
  - **Escenario 5: Compra fallida por falta de selección de productos.**
    Dado un usuario no premium (Nicolás Guzzo) previamente logueado con éxito, y los productos Fernet ($1.500), Gancia ($2.000), Vermú ($5.000) y Ruttini ($2.500),
    Cuando el usuario no selecciona ninguna bebida de la lista y presiona "Confirmar compra",
    Entonces el sistema no registra ninguna compra por falta de selección de productos, mostrando en pantalla el mensaje "No se registró ninguna selección de bebidas, por favor reinténtelo".


## Problema 4 — Préstamo de Kits

### HU: Realizar préstamo de kit
- **ID:** Reservar kit
- **Título:** Como usuario quiero pedir un préstamo de un kit para realizar grabaciones.
- **Reglas de negocio:**
  - No se puede realizar un préstamo si el usuario tiene un préstamo anterior activo.
  - No se puede realizar un préstamo con duración mayor a 3 horas.
  *(⚠️ ver duda anotada en Practica-2-Notas.md: si la disponibilidad del kit debiera ser regla de negocio, y su consistencia con el criterio aplicado a "Reservar muebles" en Problema 1)*
- **Criterios de aceptación:**
  - **Escenario 1: Préstamo exitoso.**
    Dado un usuario autenticado (Nicolás) sin ningún préstamo anterior activo, y los kits básico y avanzado disponibles para seleccionar,
    Cuando Nicolás selecciona el kit básico, día miércoles, hora de retiro 14:00 y duración de préstamo 2 horas, y presiona "Pedir préstamo",
    Entonces el sistema valida correctamente la petición e informa en pantalla "Préstamo realizado correctamente".
  - **Escenario 2: Préstamo fallido por tener un préstamo anterior activo.**
    Dado un usuario autenticado (Nicolás) con un préstamo anterior activo, y los kits básico y avanzado disponibles para seleccionar,
    Cuando Nicolás selecciona el kit básico, día miércoles, hora de retiro 14:00 y duración de préstamo 2 horas, y presiona "Pedir préstamo",
    Entonces el sistema no valida el préstamo porque el usuario mantiene un préstamo anterior activo, informando en pantalla "La petición de préstamo fue rechazada, usted mantiene un préstamo anterior activo".
  - **Escenario 3: Préstamo fallido por exceder las 3 horas de duración.**
    Dado un usuario autenticado (Nicolás) sin ningún préstamo anterior activo, y los kits básico y avanzado disponibles para seleccionar,
    Cuando Nicolás selecciona el kit básico, día miércoles, hora de retiro 14:00 y duración de préstamo 4 horas (más de las permitidas), y presiona "Pedir préstamo",
    Entonces el sistema no valida el préstamo porque se seleccionaron más horas de las permitidas, informando en pantalla "Préstamo rechazado, la reserva no puede superar las 3 horas".
  - **Escenario 4: Préstamo fallido por falta de disponibilidad del kit avanzado.**
    Dado un usuario autenticado (Nicolás) sin ningún préstamo anterior activo, el kit básico disponible y el kit avanzado sin disponibilidad,
    Cuando Nicolás selecciona el kit avanzado, día miércoles, hora de retiro 14:00 y duración de préstamo 2 horas, y presiona "Pedir préstamo",
    Entonces el sistema no valida el préstamo porque el kit avanzado no se encuentra disponible, informando en pantalla "Préstamo rechazado, el kit avanzado no se encuentra disponible en este momento".
  - **Escenario 5: Préstamo fallido por falta de disponibilidad del kit básico.**
    Dado un usuario autenticado (Nicolás) sin ningún préstamo anterior activo, el kit avanzado disponible y el kit básico sin disponibilidad,
    Cuando Nicolás selecciona el kit básico, día miércoles, hora de retiro 14:00 y duración de préstamo 2 horas, y presiona "Pedir préstamo",
    Entonces el sistema no valida el préstamo porque el kit básico no se encuentra disponible, informando en pantalla "Préstamo rechazado, el kit básico no se encuentra disponible en este momento".


### HU: Agregar elemento
- **ID:** Agregar elemento
- **Título:** Como administrador quiero agregar un elemento para poder ampliar el catálogo de elementos disponibles. *(⚠️ ver duda anotada en Practica-2-Notas.md sobre si corresponde hacer referencia a un kit en esta HU)*
- **Reglas de negocio:**
  - Si el elemento no es nacional, se debe guardar un impuesto adicional del 10% sobre el precio de compra.
  - Un elemento no puede superar el valor de $1.000.000.
  - El número de serie de un elemento debe ser único.
- **Criterios de aceptación:**
  - **Escenario 1: Alta de elemento nacional exitosa.**
    Dado un administrador autenticado y un elemento con número de serie único 123, tipo trípode, precio de compra 150.000, origen de fabricación nacional y fecha de alta 06/09/2025,
    Cuando el administrador ingresa el elemento con número de serie 123, tipo trípode, precio de compra 150.000, origen de fabricación nacional y fecha de alta 06/09/2025, y presiona "Confirmar elemento",
    Entonces el sistema valida correctamente el alta del elemento y muestra en pantalla el mensaje "Elemento agregado correctamente".
  - **Escenario 2: Alta de elemento no nacional exitosa.**
    Dado un administrador autenticado y un elemento con número de serie único 123, tipo trípode, precio de compra 150.000, origen de fabricación Brasil y fecha de alta 06/09/2025,
    Cuando el administrador ingresa el elemento con número de serie 123, tipo trípode, precio de compra 150.000, origen de fabricación Brasil y fecha de alta 06/09/2025, y presiona "Confirmar elemento",
    Entonces el sistema valida correctamente el alta del elemento, agrega el 10% de impuesto adicional al precio de compra por ser no nacional, y muestra en pantalla el mensaje "Elemento agregado correctamente".
  - **Escenario 3: Alta fallida por precio superior a $1.000.000.**
    Dado un administrador autenticado y un elemento con número de serie único 123, tipo trípode, precio de compra 1.150.000, origen de fabricación Brasil y fecha de alta 06/09/2025,
    Cuando el administrador ingresa el elemento con número de serie 123, tipo trípode, precio de compra 1.150.000, origen de fabricación Brasil y fecha de alta 06/09/2025, y presiona "Confirmar elemento",
    Entonces el sistema no valida el alta por exceder el precio máximo permitido, informando en pantalla "No se puede agregar el elemento, su precio supera el valor máximo permitido ($1.000.000)".
  - **Escenario 4: Alta fallida por número de serie repetido.**
    Dado un administrador autenticado y un elemento con número de serie 123 ya registrado en otro elemento, tipo trípode, precio de compra 150.000, origen de fabricación Brasil y fecha de alta 06/09/2025,
    Cuando el administrador ingresa el elemento con número de serie 123, tipo trípode, precio de compra 150.000, origen de fabricación Brasil y fecha de alta 06/09/2025, y presiona "Confirmar elemento",
    Entonces el sistema no registra el nuevo elemento, mostrando en pantalla el mensaje "El elemento no puede ser agregado, existe otro elemento con el mismo número de serie".

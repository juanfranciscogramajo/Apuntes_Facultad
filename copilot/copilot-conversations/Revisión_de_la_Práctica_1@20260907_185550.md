---
epoch: 1788818150261
modelKey: "1d33b567-c5ae-4f27-9f25-8d2356389b88"
topic: "Revisión de la Práctica 1"

tags:
  - copilot-conversation
---

**user**: Que opinas de como hice los ejercicios de la practica 1
[Context: Notes: ING1/Practica/Practica 1 HU.md]
[Timestamp: 2026/09/07 18:55:50]

**ai**: Los ejercicios están **muy bien encaminados**. Se nota que entendiste la estructura de las Historias de Usuario (Frente y Reverso), el valor de negocio (*Como / Quiero / Para*) y la formulación de Criterios de Aceptación con formato Gherkin (*Dado / Cuando / Entonces*), cubriendo tanto el camino feliz como los flujos alternativos y de error.

A continuación, te dejo observaciones detalladas y sugerencias de mejora puntuales para pulirlos al nivel que se suele exigir en Ingeniería de Software:

---

### 1. Aspectos Generales a Mejorar

- **IDs de las Historias**: En el campo `ID:`, estás repitiendo el título (ej. `ID: Dar de Alta un mueble`). Lo estándar es asignarles un código unívoco corto para trazabilidad (ej. `HU-01`, `HU-MOB-01`, etc.).
- **Consistencia de Roles**: 
  - En el ejercicio 1 defines el rol **Encargado del departamento de mobiliario**, pero en los criterios de aceptación escribes *"Dado que el administrador..."*. Es fundamental mantener el mismo nombre de rol para no generar ambigüedad.
  - En el ejercicio 2 usas **Usuario**. Aunque no está mal, en hotelería suele ser más preciso usar **Huésped** o **Cliente**.

---

### 2. Ejercicio 1 (Alquiler de Muebles)

#### HU: Dar de alta mobiliario
- **Escenario 1 y 2**: Cambiar *"administrador"* por *"encargado"*.
- **Escenario 3 (Falta de autenticación)**: Está bien pensado, aunque en muchas metodologías la autenticación se considera una precondición implícita o una HU transversal. Como ejercicio para evaluar la regla de negocio, es totalmente válido.

#### HU: Hacer reserva de un alquiler
- **Escenario 4 (Reserva fallida por saldos insuficientes)**: 
  - *Cómo lo pusiste*: 
    - *Cuando:* el sistema valida los fondos a través del servicio del banco...
  - *Detalle técnico Gherkin*: El bloque **Cuando** debe representar la **acción del usuario** (el estímulo), no la reacción interna del sistema.
  - *Sugerencia*:
    - **Dado** que el cliente ingresa una tarjeta de crédito válida pero con fondos insuficientes para cubrir el 20%,
    - **Cuando** confirma el pago de la reserva,
    - **Entonces** el sistema cancela la operación y notifica que la tarjeta no posee saldo suficiente.

---

### 3. Ejercicio 2 (Hotel / Hospedaje)

#### HU: Reservar un hospedaje
- **Mezcla de Reglas de Negocio (Importante)**: 
  - En esta historia listaste: *“Los check in entre las 10am y las 23:59pm”* y *“Solo check out habitaciones sin gastos”*. 
  - **Corrección**: Esas dos reglas pertenecen exclusivamente a las HUs de **Check-in** y **Check-out**, no a la reserva previa de la estadía. En la reserva solo deben quedar las reglas de los 90 días de anticipación y los 15 días de duración máxima.
- **Escenario 1**: Hay una repetición tipográfica: *"cuando confirma el usuario confirma la reserva"*.
- **Escenario 3 (Estadía mayor a 15 días)**:
  - *Cómo lo pusiste*: Pusiste la condición dentro del *Entonces* (*"entonces la duración del viaje supera los 15 días, entonces el sistema le informa..."*).
  - *Sugerencia*:
    - **Dado** que el usuario selecciona una fecha de ingreso y una fecha de salida con una diferencia mayor a 15 días,
    - **Cuando** intenta confirmar la reserva,
    - **Entonces** el sistema bloquea la acción e informa que la estadía excede el límite permitido de 15 días.

#### HU: Realizar check-in
- **Escenario 1 (Check-in exitoso)**:
  - En el **Cuando** pusiste: *"cuando ingresa su codigo el sistema confirma que tiene una reserva para la fecha actual"*.
  - La verificación que hace el sistema es parte del proceso interno o del contexto, la acción es simplemente ingresar el código.
  - *Sugerencia*:
    - **Dado** que el huésped se presenta dentro del horario habilitado (10:00 a 23:59) y posee una reserva válida para la fecha actual,
    - **Cuando** ingresa su código de reserva en la terminal,
    - **Entonces** el sistema le asigna la habitación, notifica al conserje para guiarlo y avisa a los botones para el traslado del equipaje.

#### HU: Realizar check-out
- **Copy-paste involuntario**: En el reverso pusiste: `Criterios de aceptación: (Realizar check in)` en vez de `(Realizar check-out)`.
- Los dos escenarios (exitoso y con deudas) están **excelentemente planteados**.

---

### Resumen
La base conceptual está muy sólida. Los flujos cubren las reglas de negocio solicitadas; puliendo la precisión del formato **Dado / Cuando / Entonces** (separando siempre la acción del usuario de la validación del sistema) y delimitando qué regla pertenece a qué historia, la entrega queda impecable.
[Timestamp: 2026/09/07 18:58:07]

**user**: okey hace los cambios
[Context: Notes: ING1/Practica/Practica 1 HU.md]
[Timestamp: 2026/09/07 18:58:14]

**ai**: Aquí tienes la versión completa y corregida de la práctica, lista para reemplazar o actualizar en tu nota [[Practica 1 HU]]:

---

# Ejercicio 1: Alquiler de Mobiliario

### Roles de usuario:
- Encargado del departamento de mobiliario
- Cliente

---

#### FRENTE
**ID:** HU-MOB-01  
**Título:** Dar de alta un mueble  
**Como** Encargado del departamento de mobiliario  
**Quiero** dar de alta un mueble en el sistema  
**Para** que esté disponible para ser alquilado  

**REGLAS DE NEGOCIO:**
- No pueden existir códigos de inventario repetidos.
- Requiere autenticación del encargado para realizar el alta.
- El registro de los usuarios de carga no debe modelarse.
- Estados posibles del mueble: únicamente libre, de baja o alquilado.

#### REVERSO
**Criterios de aceptación (Dar de alta un mueble):**

- **Escenario 1: Alta exitosa**
  - **Dado** que el encargado se encuentra autenticado en el sistema y el código de inventario "M-001" no existe,
  - **Cuando** ingresa los datos obligatorios (tipo, fechas, estado inicial "libre", precio) y confirma el alta,
  - **Entonces** el sistema guarda el mueble exitosamente y queda disponible para alquiler.

- **Escenario 2: Alta fallida por código de inventario duplicado**
  - **Dado** que el encargado se encuentra autenticado y el código de inventario "M-001" ya existe en el sistema,
  - **Cuando** ingresa los datos obligatorios y confirma el alta,
  - **Entonces** el sistema rechaza la operación e informa que el código de inventario ya se encuentra registrado.

- **Escenario 3: Alta fallida por falta de autenticación**
  - **Dado** que el usuario no se encuentra autenticado en el sistema,
  - **Cuando** intenta dar de alta un mueble,
  - **Entonces** el sistema bloquea la acción y solicita el inicio de sesión.

---

#### FRENTE
**ID:** HU-MOB-02  
**Título:** Hacer reserva de alquiler  
**Como** Cliente  
**Quiero** reservar mobiliario para un evento  
**Para** asegurar la disponibilidad de los muebles en la fecha requerida  

**REGLAS DE NEGOCIO:**
- Se requiere un mínimo de 3 muebles por reserva.
- Para confirmar la reserva, se debe abonar una seña equivalente al 20% del total mediante tarjeta de crédito válida.
- Los muebles seleccionados deben estar en estado "libre" para las fechas solicitadas.

#### REVERSO
**Criterios de aceptación (Hacer reserva de un alquiler):**

- **Escenario 1: Reserva exitosa**
  - **Dado** que el cliente seleccionó 3 o más muebles en estado "libre" e ingresó una tarjeta con fondos suficientes para el 20% de seña,
  - **Cuando** confirma la operación de reserva,
  - **Entonces** el sistema debita el 20%, genera el comprobante de reserva y cambia el estado de los muebles a "alquilado" para esas fechas.

- **Escenario 2: Reserva fallida por cantidad insuficiente de muebles**
  - **Dado** que el cliente ha seleccionado menos de 3 muebles en su solicitud,
  - **Cuando** intenta avanzar al paso de confirmación/pago,
  - **Entonces** el sistema bloquea el avance y notifica que se requiere un mínimo de 3 muebles para reservar.

- **Escenario 3: Reserva fallida por mueble no disponible**
  - **Dado** que al menos uno de los muebles seleccionados ya no se encuentra en estado "libre" para el rango de fechas solicitado,
  - **Cuando** el cliente intenta confirmar la reserva,
  - **Entonces** el sistema cancela la operación y notifica cuáles muebles no están disponibles.

- **Escenario 4: Reserva fallida por fondos insuficientes o rechazo de tarjeta**
  - **Dado** que el cliente seleccionó al menos 3 muebles libres e ingresó los datos de una tarjeta sin fondos suficientes o rechazada por la entidad bancaria,
  - **Cuando** confirma el pago de la seña,
  - **Entonces** el sistema notifica el rechazo del pago, cancela la operación y mantiene los muebles en estado "libre".

---

# Ejercicio 2: Cadena Hotelera

### Roles de usuario:
- Huésped (o Cliente)

---

#### FRENTE
**ID:** HU-HOT-01  
**Título:** Reservar un hospedaje  
**Como** Huésped  
**Quiero** realizar una reserva de habitación  
**Para** asegurar mi alojamiento en el hotel  

**REGLAS DE NEGOCIO:**
- La reserva solo puede realizarse con un máximo de 90 días de anticipación respecto a la fecha de ingreso.
- La estadía no puede superar los 15 días consecutivos.
- Requiere disponibilidad de habitación en las fechas seleccionadas.

#### REVERSO
**Criterios de aceptación (Reservar un hospedaje):**

- **Escenario 1: Reserva de hospedaje exitosa**
  - **Dado** que el huésped selecciona fechas con una anticipación menor o igual a 90 días y una duración no mayor a 15 días, con habitación disponible,
  - **Cuando** confirma la reserva,
  - **Entonces** el sistema registra la reserva, descuenta la disponibilidad de la habitación y genera el código único de reserva.

- **Escenario 2: Reserva fallida por anticipación mayor a 90 días**
  - **Dado** que el huésped selecciona una fecha de ingreso que supera los 90 días corridos a partir de la fecha actual,
  - **Cuando** intenta confirmar la reserva,
  - **Entonces** el sistema impide la acción e informa que no se pueden realizar reservas con más de 90 días de antelación.

- **Escenario 3: Reserva fallida por estadía mayor a 15 días**
  - **Dado** que el huésped selecciona un período de estadía superior a 15 días consecutivos,
  - **Cuando** intenta confirmar la reserva,
  - **Entonces** el sistema impide la acción e informa que la duración máxima de hospedaje permitida es de 15 días.

---

#### FRENTE
**ID:** HU-HOT-02  
**Título:** Realizar check-in  
**Como** Huésped  
**Quiero** registrar mi ingreso en la terminal de autoservicio  
**Para** obtener el acceso a mi habitación y recibir asistencia  

**REGLAS DE NEGOCIO:**
- El check-in solo puede realizarse entre las 10:00 y las 23:59 del día de inicio de la reserva.
- El huésped debe poseer una reserva válida y confirmada para la fecha actual.
- Al completar el ingreso, el sistema debe emitir aviso al conserje (para guiar al huésped) y a los botones (
<errorChunk>[GoogleGenerativeAI Error]: Failed to parse stream</errorChunk>
[Timestamp: 2026/09/07 18:59:31]

**user**: <font color="#ff0000">Rol de usuarios:</font>

<font color="#ff0000">Historias de usuario:</font>

<p align="right"><font color="#de7802">FRENTE</font></p>

<font color="#ff0000">ID:</font>

<font color="#ff0000">Titulo: Como quiero para</font>

<font color="#ff0000">REGLAS DE NEGOCIO:</font>

<p align="right"><font color="#f79646">REVERSO</font></p>

<font color="#ff0000">Criterios de aceptación:</font>

<font color="#ffc000">Escenario :</font>

<font color="#00b050">Dado</font>

<font color="#00b050">cuando</font>

<font color="#00b050">entonces</font>
esta es la plantilla para hacer las historias de usuario. Necesito que sigas esa plantilla para las historias de usuarios del documento
[Context: Notes: ING1/Practica/Practica 1 HU.md]
[Timestamp: 2026/09/07 20:21:48]

**ai**: 
<errorChunk>[GoogleGenerativeAI Error]: Error fetching from https://generativelanguage.googleapis.com/v1beta/models/gemini-3.1-pro-preview:streamGenerateContent?alt=sse: [429 ] You exceeded your current quota, please check your plan and billing details. For more information on this error, head to: https://ai.google.dev/gemini-api/docs/rate-limits. To monitor your current usage, head to: https://ai.dev/rate-limit. 
* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_input_token_count, limit: 0, model: gemini-3.1-pro
* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-3.1-pro
* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-3.1-pro
* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_input_token_count, limit: 0, model: gemini-3.1-pro
Please retry in 12.474506733s. [{"@type":"type.googleapis.com/google.rpc.Help","links":[{"description":"Learn more about Gemini API quotas","url":"https://ai.google.dev/gemini-api/docs/rate-limits"}]},{"@type":"type.googleapis.com/google.rpc.QuotaFailure","violations":[{"quotaMetric":"generativelanguage.googleapis.com/generate_content_free_tier_input_token_count","quotaId":"GenerateContentInputTokensPerModelPerMinute-FreeTier","quotaDimensions":{"model":"gemini-3.1-pro","location":"global"}},{"quotaMetric":"generativelanguage.googleapis.com/generate_content_free_tier_requests","quotaId":"GenerateRequestsPerMinutePerProjectPerModel-FreeTier","quotaDimensions":{"location":"global","model":"gemini-3.1-pro"}},{"quotaMetric":"generativelanguage.googleapis.com/generate_content_free_tier_requests","quotaId":"GenerateRequestsPerDayPerProjectPerModel-FreeTier","quotaDimensions":{"location":"global","model":"gemini-3.1-pro"}},{"quotaMetric":"generativelanguage.googleapis.com/generate_content_free_tier_input_token_count","quotaId":"GenerateContentInputTokensPerModelPerDay-FreeTier","quotaDimensions":{"location":"global","model":"gemini-3.1-pro"}}]},{"@type":"type.googleapis.com/google.rpc.RetryInfo","retryDelay":"12s"}]</errorChunk>
[Timestamp: 2026/09/07 20:21:48]

**user**: <font color="#ff0000">Rol de usuarios:</font>

<font color="#ff0000">Historias de usuario:</font>

<p align="right"><font color="#de7802">FRENTE</font></p>

<font color="#ff0000">ID:</font>

<font color="#ff0000">Titulo: Como quiero para</font>

<font color="#ff0000">REGLAS DE NEGOCIO:</font>

<p align="right"><font color="#f79646">REVERSO</font></p>

<font color="#ff0000">Criterios de aceptación:</font>

<font color="#ffc000">Escenario :</font>

<font color="#00b050">Dado</font>

<font color="#00b050">cuando</font>

<font color="#00b050">entonces</font>
esta es la plantilla para hacer las historias de usuario. Necesito que sigas esa plantilla para las historias de usuarios del documento
[Context: Notes: ING1/Practica/Practica 1 HU.md]
[Timestamp: 2026/09/07 20:22:52]

**ai**: Aquí tienes todas las Historias de Usuario de los ejercicios de tu documento corregidas y adaptadas fielmente a tu plantilla:

---

# Ejercicio 1: Alquiler de Mobiliario

<font color="#ff0000">Rol de usuarios:</font>
- Encargado del departamento de mobiliario
- Cliente

<font color="#ff0000">Historias de usuario:</font>
- Dar de alta mobiliario
- Reserva de alquiler

<p align="right"><font color="#de7802">FRENTE</font></p>

<font color="#ff0000">ID:</font> HU-01

<font color="#ff0000">Titulo:</font> Como Encargado del departamento de mobiliario quiero dar de alta un mueble para que esté disponible para ser alquilado

<font color="#ff0000">REGLAS DE NEGOCIO:</font>
- No puede existir códigos de inventario repetidos.
- Autenticación del encargado requerida para dar de alta.
- El registro de los usuarios de carga no debe modelarse.
- Estados posibles del mueble son únicamente: libre, de baja o alquilado.

<p align="right"><font color="#f79646">REVERSO</font></p>

<font color="#ff0000
<errorChunk>[GoogleGenerativeAI Error]: Failed to parse stream</errorChunk>
[Timestamp: 2026/09/07 20:23:20]

**user**: Reescribe mis historias de usuario usando estrictamente este formato nativo de Obsidian (Callouts). No uses etiquetas HTML de fuente o color.

[!info] FRENTE - HU-01: [Título breve]
Como [Rol]
Quiero [Acción]
Para [Beneficio]

[!warning]- REVERSO - Reglas y Criterios (Desplegable)
Reglas de Negocio:

[Regla 1]

[Regla 2]

Criterios de Aceptación:

[Criterio 1]"

Nota: El signo - después de [!warning]- hace que el reverso sea "plegable" (como un acordeón). Si le haces clic, se abre y te muestra las reglas, ahorrando muchísimo espacio en pantalla.
[Context: Notes: ING1/Practica/Practica 1 HU.md]
[Timestamp: 2026/09/07 20:24:34]

**ai**: Aquí tienes todas las historias de usuario de tu práctica reescritas y organizadas utilizando estrictamente los callouts nativos de Obsidian:

# Ejercicio 1: Alquiler de Mobiliario

> [!info] FRENTE - HU-MOB-01: Dar de alta un mueble
> **Como** Encargado del departamento de mobiliario  
> **Quiero** dar de alta un mueble en el sistema  
> **Para** que esté disponible para ser alquilado  

> [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> **Reglas de Negocio:**
> - No pueden existir códigos de inventario repetidos.
> - Se requiere autenticación del encargado para realizar el alta.
> - El registro de los usuarios de carga no debe modelarse.
> - Los estados posibles del mueble son únicamente: libre, de baja o alquilado.
> 
> **Criterios de Aceptación:**
> 
> - **Escenario 1: Alta exitosa**
>   - **Dado** que el encargado se encuentra autenticado y el código de inventario "M-001" no existe en el sistema,
>   - **Cuando** ingresa los datos obligatorios (tipo, fechas, estado inicial "libre", precio) y confirma el alta,
>   - **Entonces** el sistema registra el mueble exitosamente y queda disponible para alquiler.
> 
> - **Escenario 2: Alta fallida por código de inventario duplicado**
>   - **Dado** que el encargado se encuentra autenticado y el código de inventario "M-001" ya existe en el sistema,
>   - **Cuando** ingresa los datos y confirma el alta,
>   - **Entonces** el sistema bloquea el registro e informa que el código de inventario ya se encuentra registrado.
> 
> - **Escenario 3: Alta fallida por falta de autenticación**
>   - **Dado** que el usuario no se encuentra autenticado en el sistema,
>   - **Cuando** intenta dar de alta un mueble,
>   - **Entonces** el sistema bloquea la acción y solicita el inicio de sesión previo.

---

> [!info] FRENTE - HU-MOB-02: Reserva de alquiler
> **Como** Cliente  
> **Quiero** realizar una reserva de mobiliario  
> **Para** asegurar la disponibilidad de los muebles para mi evento  

> [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> **Reglas de Negocio:**
> - Mínimo de 3 muebles por reserva.
> - Para confirmar la reserva, se debe abonar una seña del 20% del total mediante tarjeta de crédito válida.
> - Los muebles solicitados deben encontrarse en estado "libre" para el período elegido.
> 
> **Criterios de Aceptación:**
> 
> - **Escenario 1: Reserva exitosa**
>   - **Dado** que el cliente seleccionó 3 o más muebles en estado "libre" e ingresó los datos de una tarjeta con fondos suficientes,
>   - **Cuando** confirma el pago de la seña del 20%,
>   - **Entonces** el sistema procesa el cobro, emite el comprobante y cambia el estado de los muebles a "alquilado" para esas fechas.
> 
> - **Escenario 2: Reserva fallida por cantidad mínima no alcanzada**
>   - **Dado** que el cliente ha seleccionado menos de 3 muebles,
>   - **Cuando** intenta avanzar hacia la confirmación o pago,
>   - **Entonces** el sistema bloquea el avance e informa que se requiere un mínimo de 3 muebles.
> 
> - **Escenario 3: Reserva fallida por mueble no disponible**
>   - **Dado** que al menos uno de los muebles seleccionados no se encuentra en estado "libre" para las fechas solicitadas,
>   - **Cuando** el cliente intenta confirmar la reserva,
>   - **Entonces** el sistema notifica qué mueble no se encuentra disponible e impide continuar la operación.
> 
> - **Escenario 4: Reserva fallida por fondos insuficientes en tarjeta**
>   - **Dado** que el cliente seleccionó al menos 3 muebles libres e ingresó los datos de una tarjeta de crédito sin saldo suficiente para la seña,
>   - **Cuando** confirma la operación de pago,
>   - **Entonces** el sistema informa el rechazo del cobro, cancela la reserva y mantiene los muebles en estado "libre".

---

# Ejercicio 2: Cadena Hotelera

> [!info] FRENTE - HU-HOT-01: Reservar un hospedaje
> **Como** Huésped  
> **Quiero** reservar una habitación en el hotel  
> **Para** asegurar mi alojamiento con anticipación  

> [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> **Reglas de Negocio:**
> - La reserva solo puede realizarse con un máximo de 90 días de anticipación a la fecha de ingreso.
> - La estadía no puede ser superior a 15 días consecutivos.
> - Requiere disponibilidad de habitación en las fechas solicitadas.
> 
> **Criterios de Aceptación:**
> 
> - **Escenario 1: Reserva exitosa**
>   - **Dado** que el huésped selecciona fechas con menos de 90 días de anticipación y una duración menor o igual a 15 días, con disponibilidad,
>   - **Cuando** confirma la reserva,
>   - **Entonces** el sistema registra la estadía, descuenta la vacante y emite un código de reserva.
> 
> - **Escenario 2: Reserva fallida por anticipación mayor a 90 días**
>   - **Dado** que el huésped selecciona una fecha de ingreso superior a 90 días desde la fecha actual,
>   - **Cuando** intenta confirmar la reserva,
>   - **Entonces** el sistema bloquea la operación y notifica que no es posible reservar con más de 90 días de antelación.
> 
> - **Escenario 3: Reserva fallida por estadía mayor a 15 días**
>   - **Dado** que el huésped selecciona un período de estadía superior a 15 días,
>   - **Cuando** intenta confirmar la reserva,
>   - **Entonces** el sistema notifica que la estadía excede el límite permitido de 15 días y no procesa la reserva.

---

> [!info] FRENTE - HU-HOT-02: Realizar check-in
> **Como** Huésped  
> **Quiero** realizar el check-in en la terminal de autoservicio  
> **Para** obtener acceso a mi habitación e ingresar al hotel  

> [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> **Reglas de Negocio:**
> - El check-in solo se habilita entre las 10:00 y las 23:59 de la fecha de inicio de la reserva.
> - Debe existir una reserva válida para el día de la fecha.
> - Al finalizar con éxito, debe alertar automáticamente al conserje (para guiar al huésped) y a los botones (para el equipaje).
> 
> **Criterios de Aceptación:**
> 
> - **Escenario 1: Check-in exitoso**
>   - **Dado** que el huésped posee una reserva válida para la fecha actual y se encuentra entre las 10:00 y las 23:59,
>   - **Cuando** ingresa su código de reserva en la terminal,
>   - **Entonces** el sistema habilita el acceso a la habitación y envía una notificación automática al conserje y a los botones.
> 
> - **Escenario 2: Check-in fallido fuera de horario**
>   - **Dado** que el huésped se presenta en la terminal antes de las 10:00 del día de ingreso,
>   - **Cuando** ingresa su código de reserva,
>   - **Entonces** el sistema bloquea el check-in e informa que el horario de ingreso comienza a las 10:00.

---

> [!info] FRENTE - HU-HOT-03: Realizar check-out
> **Como** Huésped  
> **Quiero** realizar el check-out en la terminal de autoservicio  
> **Para** dar por concluida mi estadía y liberar la habitación  

> [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> **Reglas de Negocio:**
> - Solo se permite completar el check-out en habitaciones que no posean consumos o gastos pendientes de pago.
> 
> **Criterios de Aceptación:**
> 
> - **Escenario 1: Check-out exitoso sin gastos pendientes**
>   - **Dado** que el huésped se presenta en la terminal y su habitación no registra gastos pendientes de pago,
>   - **Cuando** ingresa su código de reserva y confirma el egreso,
>   - **Entonces** el sistema concluye la estadía, marca la habitación como disponible para limpieza y emite el comprobante final.
> 
> - **Escenario 2: Check-out bloqueado por gastos pendientes**
>   - **Dado** que la habitación registra consumos o cargos impagos asociados a la estadía,
>   - **Cuando** el huésped ingresa su código de reserva para finalizar la estadía,
>   - **Entonces** el sistema impide el check-out, detalla el saldo pendiente e indica presentarse en recepción para regularizar la cuenta.
[Timestamp: 2026/09/07 20:25:02]

**user**: nno lo resumas, deja le texto de cada historia como esta pero adaptalo a ese formato
[Context: Notes: ING1/Practica/Practica 1 HU.md]
[Timestamp: 2026/09/07 20:27:08]

**ai**: Aquí tienes tus historias de usuario manteniendo el texto tal como lo redactaste, adaptadas estrictamente al formato de Callouts nativo de Obsidian:

# Ejercicio 1

> [!info] FRENTE - HU-01: Dar de alta un mueble
> Como Encargado del departamento de mobiliario  
> Quiero dar de alta un mueble  
> Para que esté disponible para ser alquilado  

> [!warning]- REVERSO - Reglas y Criterios (Desplegable)
> Reglas de Negocio:
> - No puede existir códigos de inventarios repetidos.
> - Autenticación del encargado para dar de alta.
> - El registro de los usuarios de carga no debe modelarse.
> - Estados posibles son únicamente: libre, de baja o alquilado 
> 
<errorChunk>[GoogleGenerativeAI Error]: Failed to parse stream</errorChunk>
[Timestamp: 2026/09/07 20:27:34]
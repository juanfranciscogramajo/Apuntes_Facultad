---
tags:
  - facultad/ingenieria-de-software-1
  - requerimientos
  - redes-de-petri
materia: Ingeniería de Software I
facultad: Facultad de Informática - UNLP
Clase: Teoria 07-09
---

## 1. Tipos de Requerimientos

### Requerimientos Funcionales (RF)
* **Definición:** Describen las interacciones entre el sistema y su entorno, indicando cómo debe responder ante determinados estímulos.
* **Alcance:** Expresan en detalle todo lo que el sistema **debe hacer** y también lo que **no debe hacer**.
* **Independencia técnica:** Son agnósticos a la implementación tecnológica y a la arquitectura física de la solución.
### Requerimientos No Funcionales (RNF)
* **Definición:** Imponen restricciones sobre el sistema que delimitan y condicionan las decisiones de diseño y construcción.
* **Clasificación principal:**
  1. **Del Producto:** Especifican el comportamiento en ejecución (usabilidad, eficiencia, rendimiento, uso de espacio, fiabilidad y portabilidad).
  2. **Organizacionales:** Derivan de las normas, políticas y estándares de la empresa del cliente o del equipo desarrollador (políticas de entrega, procesos de implementación, estándares de codificación).
  3. **Externos:** Derivan de factores fuera del control directo del proyecto (interoperabilidad con terceros, marco regulatorio/legal, privacidad, seguridad de datos y ética).

> [!TIP] Comprobabilidad y Métricas
> Un RNF redactado de forma vaga (*"el sistema debe ser fácil de usar"*) no es verificable. Debe formularse de manera cuantificable: *"Tras 4 horas de capacitación, los operadores utilizarán todas las funciones cometiendo en promedio menos de 2 errores por hora de uso"*.

| Propiedad | Métricas de Medición Cuantificable |
| :--- | :--- |
| **Rapidez** | Transacciones procesadas por segundo; tiempo de respuesta a eventos; tiempo de refresco de pantalla. |
| **Tamaño** | Memoria requerida (Mbytes); cantidad de chips ROM o módulos. |
| **Facilidad de uso** | Horas requeridas de capacitación; cantidad de cuadros o ayudas en pantalla. |
| **Fiabilidad** | MTTF (*Mean Time To Failure*); tasa de fallas; disponibilidad (%); probabilidad de indisponibilidad. |
| **Robustez** | Tiempo de reinicio tras caída; porcentaje de eventos que originan falla; probabilidad de corrupción de datos. |
| **Portabilidad** | Porcentaje de código dependiente de plataforma; cantidad de sistemas operativos soportados. |

---

## 2. Ingeniería de Requerimientos (IR)

### Definición y Propósito
Es la disciplina y enfoque sistémico orientado a transformar los requerimientos expresados por los clientes (verbales o escritos) en especificaciones precisas, no ambiguas, consistentes y completas (**SRS - Software Requirements Specification**). Actúa como el contrato base y punto de acuerdo formal entre las partes interesadas.

### Beneficios
* Estructura la gestión de necesidades y cambios.
* Mejora la precisión de los cronogramas y plazos.
* Disminuye retrasos y sobrecostos.
* Incrementa la calidad del software y la coordinación del equipo.
* Minimiza el rechazo de los usuarios finales.

### Proceso de Requerimientos: Secuencial vs. Espiral
* **Esquema secuencial (teórico):** Estudio de viabilidad $\to$ Obtención y análisis $\to$ Especificación $\to$ Validación $\to$ Documento de Requerimientos.
* **Modelo en espiral (realidad práctica):** Es un proceso iterativo donde las etapas se entrelazan y refinan cíclicamente en tres niveles: requerimientos de la empresa, del usuario y del sistema.

### Estudio de Viabilidad
Informe preliminar (indispensable para sistemas nuevos) que dictamina si conviene o no emprender el desarrollo evaluando:
1. ¿El sistema contribuye a los objetivos del negocio? *(Si no aporta valor real a la organización, no debe construirse).*
2. ¿Se puede implementar con la tecnología disponible?
3. ¿Es realizable dentro del presupuesto y plazos establecidos?
4. ¿Puede integrarse con los sistemas y la infraestructura preexistente?

### Validación de Requerimientos
Proceso enfocado en certificar que el modelo de requerimientos refleja fielmente las necesidades y expectativas reales del usuario.

> [!NOTE] Validación vs. Verificación (Estándar IEEE)
> * **Validación:** *"Hacer el software correcto"* $\implies$ Evaluar junto al usuario si el sistema cumple con lo que él verdaderamente necesita.
> * **Verificación:** *"Hacer el software correctamente"* $\implies$ Comprobar técnicamente que el producto satisface las especificaciones documentadas.

* **Criterios de control:** Validez, consistencia (sin contradicciones), completitud, realismo y verificabilidad (diseño de pruebas para comprobarlos).
* **Curva de Boehm (Efecto Bola de Nieve):** Un error introducido en requerimientos que se detecta en etapas avanzadas o en producción multiplica su costo de corrección de forma exponencial.
* **Técnicas:** Revisiones formales (guiadas por el desarrollador) e informales (charlas con stakeholders), prototipado y derivación temprana de casos de prueba.

---

## 3. Especificación Formal con Redes de Petri (RP)

### Fundamentos y Concurrencia
Creadas por **Carl Petri** (Universidad de Bonn), son un formalismo gráfico y matemático para modelar **sistemas de eventos discretos, sistemas en tiempo real y concurrencia**.
* **Sistemas concurrentes:** Múltiples procesos se ejecutan simultáneamente en varios procesadores o intercalados en un procesador. Se caracterizan por un orden impredecible (no secuencial), sincronización y recursos compartidos.

### Definición Formal
Una Red de Petri es un **multigrafo bipartito y dirigido** formalizado como una 4-upla:
$$C = (P, T, I, O)$$

* **$P = \{p_1, p_2, \dots, p_m\}$ (Lugares / Sitios):** Círculos que modelan **estados o condiciones**.
* **$T = \{t_1, t_2, \dots, t_n\}$ (Transiciones):** Barras o líneas que modelan **eventos o acciones**.
* **$I: T \to P$ (Función de entrada):** Mapea los lugares requeridos para habilitar una transición.
* **$O: T \to P$ (Función de salida):** Mapea los lugares donde se depositan tokens tras la transición.

### Marcación y Reglas de Disparo
* **Tokens (Fichas):** Puntos asignados a los lugares.
* **Marcación ($M$):** Vector que representa la distribución actual de tokens: $M = (k_1, k_2, \dots, k_m)$. Define el estado global del sistema.
* **Condición de Habilitación:** Una transición está habilitada si cada uno de sus lugares de entrada contiene al menos tantos tokens como arcos se dirigen hacia dicha transición.
* **Disparo (*Firing*):**
  * Se asume **instantáneo**.
  * Retira los tokens de los lugares de entrada y deposita tokens en los lugares de salida.
  * La ejecución es **asincrónica y no determinística** (si varias transiciones están habilitadas en simultáneo, el orden de disparo no está prefijado).

---

## 4. Patrones de Modelado en Redes de Petri

### A. Paralelismo (Bifurcación / Fork)
Una transición produce tokens en dos o más lugares independientes al mismo tiempo, habilitando la ejecución en paralelo.

### B. Sincronización (Join)
Una transición exige tokens de varios lugares de entrada simultáneamente para activarse, coordinando procesos paralelos en un punto común.

### C. Exclusión Mutua (Mutex)
Varios procesos compiten por un recurso crítico limitado. Se modela con un lugar con capacidad fija (ej. 1 token). La transición que dispara primero consume el token y bloquea a las demás hasta que el recurso sea liberado.

### D. Productor - Consumidor
Un proceso produce elementos y los almacena en un lugar intermedio (*buffer*), mientras otro proceso los toma para consumirlos. Permite desacoplar velocidades de trabajo.

### E. Condición de Bloqueo (*Deadlock*)
Estado en el cual ninguna transición de la red queda habilitada, paralizando la evolución del sistema debido a esperas circulares por recursos.

---

## 5. Ejemplos Prácticos de la Cátedra

### 1. Brazo Robot (Manufactura Flexible)
* **Lugares del modelo:**
  * $p_1$: Pieza en banda de entrada.
  * $p_2$: Robot disponible.
  * $p_3$: Pieza cargada en el brazo.
  * $p_4$: Máquina de proceso disponible.
  * $p_5$: Máquina en operación.
  * $p_6$: Pieza descargada del proceso.
  * $p_7$: Pieza en banda de salida.
* **Ciclo de estados (Marcaciones):**
  1. $M_0 = (1, 1, 0, 1, 0, 0, 0)$: Pieza en entrada, robot y máquina libres. Se habilita $t_1$.
  2. $M_1 = (0, 0, 1, 1, 0, 0, 0)$: Robot toma la pieza ($t_1$).
  3. $M_2 = (0, 1, 0, 0, 1, 0, 0)$: Robot deposita la pieza en la máquina ($t_2$); robot queda libre, máquina ocupada.
  4. $M_3 = (0, 0, 0, 0, 0, 1, 0)$: Robot toma la pieza procesada ($t_3$).
  5. $M_4 = (0, 1, 0, 1, 0, 0, 1)$: Robot deposita la pieza en salida ($t_4$); robot y máquina vuelven a quedar libres.
  6. Disparo de $t_5$: La pieza se retira y el sistema vuelve a $M_0$.

### 2. Estación de Servicio
* **Condiciones del problema:**
  * Espera interna limitada a **5 autos** (los que superen el cupo esperan afuera).
  * **3 surtidores** de combustible (1 auto por surtidor a la vez: exclusión mutua).
  * Cola para pagar: capacidad sin límite.
  * **2 cajas** de pago (1 auto por caja a la vez: exclusión mutua).
* **Estrategia en Redes de Petri:**
  * La entrada se restringe con un lugar de control inicializado con **5 tokens**, impidiendo que entren más de 5 autos hasta que uno avance a la zona de carga.
  * Los recursos con exclusión mutua se modelan con lugares de control dedicados: un lugar con **3 tokens** para los surtidores libres y otro con **2 tokens** para las cajas libres.
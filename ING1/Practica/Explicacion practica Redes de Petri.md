## 1. Concepto y Propósito

* Las **Redes de Petri** permiten modelar sistemas dinámicos y concurrentes mediante una representación gráfica de eventos discretos[cite: 1].
* Estructuralmente, una red de Petri consiste en un **grafo dirigido** compuesto por 4 componentes principales: sitios, transiciones, arcos y tokens (marcas)[cite: 1].

---

## 2. Componentes Fundamentales

| Componente | Representación Gráfica | Función y Significado |
| :--- | :---: | :--- |
| **Sitio (Place)** | Círculo ($\bigcirc$) | Modela un **estado** o una **condición** del sistema (según el punto de vista de interpretación adoptado)[cite: 1]. |
| **Transición** | Barra o línea ($\vert$) | Modela un **evento** o una **acción**[cite: 1]. |
| **Arco** | Flecha ($\to$) | Conecta de manera unidireccional un sitio con una transición o una transición con un sitio[cite: 1]. **Regla estricta:** Nunca conecta sitio con sitio ni transición con transición[cite: 1]. |
| **Marca (Token)** | Punto ($\bullet$) | Elemento dinámico que se aloja dentro de los sitios[cite: 1]. Su función es habilitar o deshabilitar transiciones para gobernar la ejecución de la red[cite: 1]. Un sitio puede contener más de un token[cite: 1]. |

> [!NOTE] Naturaleza Bipartita
> Al ser un grafo bipartito estricto, el flujo de ejecución siempre debe alternar entre estados y acciones: $\text{Sitio} \to \text{Transición} \to \text{Sitio}$[cite: 1].

---

## 3. Dinámica y Reglas de Funcionamiento

### A. Transición Habilitada
* Una transición se encuentra habilitada cuando hay **al menos un token por cada arco** que llega a ella desde sus sitios de entrada[cite: 1].
* Si falta al menos un token en cualquiera de los arcos entrantes, la transición permanece deshabilitada y no puede dispararse[cite: 1].
![[Pasted image 20260914161851.png]]
### B. Propagación de Tokens (Disparo)
* Cuando una transición habilitada se dispara en un instante de tiempo $i$, absorbe tantos tokens como arcos llegan a ella[cite: 1].
* En el instante inmediatamente posterior ($i + \Delta$), la transición produce y deposita tantos tokens como arcos salen de ella[cite: 1].
  ![[Pasted image 20260914161918.png]]---
materia: Ingeniería de Software I
facultad: Facultad de Informática - UNLP
tema: Resumen Completo - Requerimientos y Redes de Petri
año: 2026
tags:
  - facultad/ingenieria-de-software-1
  - requerimientos
  - redes-de-petri
  - sistemas-concurrentes
  - especificacion
---
## 4. Convenciones de Modelado de la Cátedra (UNLP)

> [!IMPORTANT] Reglas Obligatorias para Parciales y Prácticas
> 1. **Convención de inicio (Transición fuente):** Para indicar que pueden ingresar o producirse cantidades arbitrarias o ilimitadas de elementos/tokens, se utiliza una transición sin entradas[cite: 1, 2]. Puede haber más de una[cite: 1, 2].
> 2. **No bloquear la red:** Toda transición presente en el grafo debe tener oportunidad de quedar habilitada alguna vez durante el ciclo[cite: 1, 2].
> 3. **Nombres unívocos y obligatorios:** Todos los sitios y transiciones deben tener nombres explícitos y distintos dentro del diagrama[cite: 1, 2]. Las transiciones pueden nombrarse por lo que finaliza o por la etapa que comienza[cite: 1, 2].
> 4. **Convención de fin (Transición final o sumidero):** Para drenar y eliminar tokens consumidos que finalizan su ciclo, se utiliza una transición sin lugares de salida[cite: 1, 2]. Puede haber más de una[cite: 1, 2].

---

## 7. Patrones Fundamentales en Redes de Petri

### A. Secuencia Simple
Un estado conduce linealmente al siguiente mediante una transición: $P_1 \to T_1 \to P_2$.

### B. Paralelismo (Bifurcación / Fork)
Una transición habilitada genera tokens simultáneos hacia dos o más sitios independientes, bifurcando la ejecución en ramas concurrentes[cite: 1, 3].

### C. Sincronización (Join)
Una transición demanda tokens procedentes de múltiples sitios previos para habilitarse, actuando como barrera de concurrencia[cite: 1, 3].

### D. Exclusión Mutua (Mutex)
Mecanismo para compartir un recurso finito (como un dispositivo o empleado)[cite: 1, 3]. Se modela con un sitio de recurso provisto de tokens iniciales; el proceso toma el recurso al iniciar su tarea y lo repone al finalizar, imposibilitando el uso concurrente indebido[cite: 1, 3].

### E. Productor - Consumidor
El productor ejecuta las acciones de producir y depositar en un sitio intermedio denominado **Buffer**[cite: 1, 3]. El consumidor extrae datos de dicho buffer y los procesa de manera asincrónica[cite: 1, 3].

### F. Condición de Bloqueo (Deadlock)
Ocurre cuando el sistema alcanza una marcación en la cual ninguna transición puede ser habilitada, deteniendo indefinidamente la red[cite: 3, 4].

---

## 8. Casos de Estudio y Ejemplos de Cátedra

### Caso 1: Brazo Robot en Manufactura Flexible
* **Enunciado:** Arriban piezas por una cinta transportadora de entrada[cite: 3]. Un brazo robótico toma cada pieza y la deposita en una máquina para su procesamiento[cite: 3]. Al terminar, el robot toma nuevamente la pieza y la coloca en la cinta de salida[cite: 3].
* **Secuencia de estados y recursos:**
  * $M_0$: Pieza en cinta de entrada ($P_1$), Robot libre ($P_2$), Máquina libre ($P_4$)[cite: 4].
  * $T_1$ (*Robot toma pieza*): consume token de entrada y robot; deposita en *Pieza cargada en robot* ($P_3$)[cite: 4].
  * $T_2$ (*Robot deposita pieza en máquina*): consume de $P_3$ y $P_4$; libera el Robot ($P_2$) y activa *Máquina procesando* ($P_5$)[cite: 4].
  * $T_3$ (*Robot toma pieza terminada*): consume de máquina y robot libre; activa *Pieza terminada en robot* ($P_6$)[cite: 4].
  * $T_4$ (*Robot deposita en cinta de salida*): libera robot ($P_2$), libera máquina ($P_4$) y deposita token en *Pieza en salida* ($P_7$)[cite: 4].
  * $T_5$ (*Salida de pieza*): drena el token fuera de la red y restablece el estado inicial[cite: 4].

---

### Caso 2: Estación de Servicio
* **Restricciones del dominio:**
  * Los vehículos arriban y esperan para ingresar[cite: 3].
  * Capacidad máxima del playón de espera interno: **5 lugares de espera** (si está colmado, deben aguardar afuera)[cite: 3, 4].
  * **3 surtidores** de combustible independientes (1 auto por surtidor a la vez: exclusión mutua)[cite: 3, 4].
  * Cola para pagar: capacidad sin límite[cite: 3, 4].
  * **2 cajas** de pago (pasan de a uno por vez: exclusión mutua)[cite: 3, 4].
  * Finalizado el pago, el auto se retira de la estación[cite: 3].
* **Resolución con RP:**
  * **Cupo de 5 autos:** Se modela con un lugar con 5 tokens iniciales (*Lugares de espera libres*); el vehículo consume un token al ingresar y lo devuelve únicamente al acceder al surtidor[cite: 3, 4].
  * **Surtidores:** Sitio con 3 tokens iniciales (*Surtidores libres*) en lazo cerrado con el inicio y fin de la carga[cite: 3, 4].
  * **Cajas:** Sitio con 2 tokens iniciales (*Cajas libres*) en lazo cerrado con el inicio y fin del cobro[cite: 3, 4].

---

### Caso 3: Línea de Embotellado y Empaque en Lotes
* **Enunciado:** Entrada continua de botellas, sector de llenado, sector de tapado y etiquetado, acumulación para formar un lote de 6 botellas, registro del cajón en el sistema y distribución final.
* **Lógica del lote de 6 unidades:**
  * Las botellas avanzan por los sitios: `Botella esperando a ser llenada, tapada y etiquetada` $\to$ `Llenando botella` $\to$ `Tapando y etiquetando botella`.
  * Pasan al sitio `Formando el lote de 6 botellas`[cite: 1].
  * Desde este sitio parten **6 arcos simultáneos** hacia la transición `Cajón armado`[cite: 1]. La transición solo se habilita al reunir al menos 6 tokens en dicho lugar[cite: 1].
  * Al dispararse, consume los 6 tokens de botella y produce 1 único token en `Registrando cajón en el sistema de envíos`, avanzando a `Cargando cajón` y saliendo por `Sale a distribución`[cite: 1].
  * Un token en el sitio `Esperando una nueva botella para llenar, tapar y sellar` sincroniza el paso controlado de botellas[cite: 1].

---

### Caso 4: Campeonato de Tenis Amateur en un Club

#### Requerimientos
* Los interesados llegan y se encolan para pagar la inscripción[cite: 1].
* Hay **un solo cobrador** que atiende de a una persona por vez[cite: 1].
* Al pagar, el tenista aguarda la presencia de otro jugador para poder disputar el encuentro[cite: 1].
* Los dos jugadores pasan juntos a jugar a cualquiera de las **dos canchas** del club (cada cancha admite 1 único partido a la vez)[cite: 1].
* Si ambas canchas están ocupadas, esperan que se libere alguna[cite: 1].
* Al concluir el partido, ambos jugadores se dirigen al **vestuario común** y luego se retiran de las instalaciones[cite: 1].

#### Modelado Paso a Paso
1. **Llegada y Cobrador:**
   * Transición fuente `Llega un jugador` $\to$ Sitio `Jugador esperando para pagar`[cite: 1].
   * Sitio `Cobrador libre` con **1 token inicial**[cite: 1].
   * Transición `Comienza Inscripción` (consume de la fila y del cobrador) $\to$ Sitio `Abonando Inscripción`[cite: 1].
   * Transición `Finaliza Inscripción` $\to$ devuelve el token a `Cobrador libre` y envía el jugador a `Esperando oponente`[cite: 1].

2. **Sincronización de Jugadores y Recursos de Cancha:**
   * Desde `Esperando oponente` se conectan **2 arcos** hacia `Comienza partido 1` y **2 arcos** hacia `Comienza partido 2` (se exige que haya 2 tenistas para habilitar la partida)[cite: 1].
   * Sitios `Cancha 1 libre` y `Cancha 2 libre`, cada uno con **1 token inicial**[cite: 1].
   * Al dispararse `Comienza partido X`, se consumen los 2 jugadores y el token de la cancha, generándose 2 tokens en `Tenistas jugando en cancha X`[cite: 1].
   * La transición `Finaliza partido X` devuelve el token a `Cancha X libre` y envía los 2 tokens hacia `Utilizando vestuario`[cite: 1].

3. **Salida:**
   * La transición sumidero `Se retira del club` consume individualmente los tokens de `Utilizando vestuario` drenándolos de la red[cite: 1].

```mermaid
flowchart TD
    T_Llega["Llega un jugador (Fuente)"] --> P_FilaPago(("Jugador esperando<br>para pagar"))
    
    P_Cobrador(("Cobrador libre [•]")) --> T_ComienzaPago["Comienza Inscripción"]
    P_FilaPago --> T_ComienzaPago
    
    T_ComienzaPago --> P_Pagando(("Abonando Inscripción"))
    P_Pagando --> T_FinPago["Finaliza Inscripción"]
    T_FinPago --> P_Cobrador
    
    T_FinPago --> P_EsperaRival(("Esperando oponente"))
    
    %% Cancha 1
    P_C1_Libre(("Cancha 1 libre [•]")) --> T_IniC1["Comienza partido 1"]
    P_EsperaRival -- "2 arcos" --> T_IniC1
    T_IniC1 -- "2 arcos" --> P_JugandoC1(("Tenistas jugando<br>en cancha 1"))
    P_JugandoC1 -- "2 arcos" --> T_FinC1["Finaliza partido 1"]
    T_FinC1 --> P_C1_Libre
    
    %% Cancha 2
    P_C2_Libre(("Cancha 2 libre [•]")) --> T_IniC2["Comienza partido 2"]
    P_EsperaRival -- "2 arcos" --> T_IniC2
    T_IniC2 -- "2 arcos" --> P_JugandoC2(("Tenistas jugando<br>en cancha 2"))
    P_JugandoC2 -- "2 arcos" --> T_FinC2["Finaliza partido 2"]
    T_FinC2 --> P_C2_Libre
    
    %% Vestuario y Salida
    T_FinC1 -- "2 arcos" --> P_Vestuario(("Utilizando vestuario"))
    T_FinC2 -- "2 arcos" --> P_Vestuario
    P_Vestuario --> T_Sale["Se retira del club (Salida)"]
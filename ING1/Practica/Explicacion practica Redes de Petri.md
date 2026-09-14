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
## 4. Convenciones de Modelado de la Cátedra 

> [!IMPORTANT] Reglas Obligatorias para Parciales y Prácticas
> 1. **Convención de inicio (Transición fuente):** Para indicar que pueden ingresar o producirse cantidades arbitrarias o ilimitadas de elementos/tokens, se utiliza una transición sin entradas[cite: 1, 2]. Puede haber más de una[cite: 1, 2].
> 2. **No bloquear la red:** Toda transición presente en el grafo debe tener oportunidad de quedar habilitada alguna vez durante el ciclo[cite: 1, 2].
> 3. **Nombres unívocos y obligatorios:** Todos los sitios y transiciones deben tener nombres explícitos y distintos dentro del diagrama[cite: 1, 2]. Las transiciones pueden nombrarse por lo que finaliza o por la etapa que comienza[cite: 1, 2].
> 4. **Convención de fin (Transición final o sumidero):** Para drenar y eliminar tokens consumidos que finalizan su ciclo, se utiliza una transición sin lugares de salida[cite: 1, 2]. Puede haber más de una[cite: 1, 2].

---

## 5. Patrones Fundamentales en Redes de Petri

### A. Secuencia Simple
Un estado conduce linealmente al siguiente mediante una transición: $P_1 \to T_1 \to P_2$.

### B. Paralelismo (Bifurcación / Fork)
Una transición habilitada genera tokens simultáneos hacia dos o más sitios independientes, bifurcando la ejecución en ramas concurrentes.

### C. Sincronización (Join)
Una transición demanda tokens procedentes de múltiples sitios previos para habilitarse, actuando como barrera de concurrencia.

### D. Exclusión Mutua (Mutex)
Mecanismo para compartir un recurso finito (como un dispositivo o empleado)[cite: 1, 3]. Se modela con un sitio de recurso provisto de tokens iniciales; el proceso toma el recurso al iniciar su tarea y lo repone al finalizar, imposibilitando el uso concurrente indebido.

### E. Productor - Consumidor
El productor ejecuta las acciones de producir y depositar en un sitio intermedio denominado **Buffer**[cite: 1, 3]. El consumidor extrae datos de dicho buffer y los procesa de manera asincrónica.

### F. Condición de Bloqueo (Deadlock)
Ocurre cuando el sistema alcanza una marcación en la cual ninguna transición puede ser habilitada, deteniendo indefinidamente la red.

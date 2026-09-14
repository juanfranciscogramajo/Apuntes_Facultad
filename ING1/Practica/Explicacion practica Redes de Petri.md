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
  ![[Pasted image 20260914161918.png]]
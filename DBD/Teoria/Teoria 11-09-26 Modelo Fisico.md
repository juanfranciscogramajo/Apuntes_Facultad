# Modelo Físico (Relacional)

## 1. Conceptos Fundamentales
En la transición del diseño conceptual al modelo físico/relacional, la información se estructura mediante relaciones lógicas[cite: 4]:
* **Base de datos:** Se define como un conjunto estructurado de tablas (relaciones)[cite: 4].
* **Tupla:** Cada fila o registro dentro de una tabla[cite: 4].
* **Atributo:** Cada columna o campo que conforma la tabla[cite: 4].
* **Dominio:** Conjunto finito de valores válidos permitidos para un atributo[cite: 4].
* **Conversión de Entidades:** Cada entidad del diagrama E-R pasa a constituir una tabla independiente[cite: 4].

### Selección de Clave Primaria (PK / CP)
* Cuando una entidad posee múltiples identificadores candidatos, se elige uno como clave principal[cite: 4].
* **Identificador Subrogado / Autoincremental:** Se define de forma artificial (ej. `id_alumno`) para facilitar la indexación y evitar claves compuestas[cite: 4].
* **Claves Naturales:** Si se utilizan identificadores del mundo real, se prioriza que sean simples y compactos[cite: 4].

---

## 2. Conversión de Relaciones a Tablas
El mapeo de las interrelaciones conceptuales depende de su cardinalidad y cobertura[cite: 4]:

### A. Muchos a Muchos ($N:M$)
* **Regla:** La relación **siempre** se convierte en una nueva tabla intermedia[cite: 4].
* **Composición:** Hereda como claves foráneas (FK) las claves primarias (PK) de todas las entidades intervinientes, a las que se agregan los atributos propios de la relación[cite: 4].

### B. Uno a Muchos ($1:N$)
* **Con Cobertura Total:**
  * **No** crea una tabla nueva[cite: 4].
  * La clave primaria del lado del **$1$** viaja como **clave foránea (FK)** a la tabla del lado del **$N$**[cite: 4].
* **Con Cobertura Parcial del lado 1 (Participación opcional $0,1$):**
  * **Opción 1:** Se transfiere la FK a la tabla del lado $N$, permitiendo valores `NULL` cuando la tupla no se encuentre asociada[cite: 4].
  * **Opción 2:** Se genera una **tabla intermedia** para mapear la relación (elimina el uso de nulos a cambio de una tabla adicional)[cite: 4].

### C. Uno a Uno ($1:1$)
* Si existe dependencia existencial directa entre las entidades, **pueden unificarse en una única tabla**[cite: 4].
* Es el único escenario donde una entidad conceptual puede no constituir una tabla propia[cite: 4].

### D. Relaciones Ternarias
* Al vincular tres entidades en un esquema de muchos a muchos, se crea una **tabla intermedia** que incluye como FK las claves primarias de las tres entidades[cite: 4].

### E. Relaciones Recursivas (Reflexivas)
* Se rigen bajo las mismas pautas de las relaciones binarias[cite: 4].
* **Implementación común ($1:N$):** Se agrega un atributo adicional en la misma tabla como **clave foránea que referencia a la clave primaria de esa misma tabla** (admitiendo valores `NULL` para el registro jerárquico inicial o raíz)[cite: 4].
  Ej:![[Pasted image 20260911210713.png]]
* **Implementación con tabla intermedia:** Se aísla el vínculo en una tabla separada para evitar columnas con valores nulos[cite: 4].

---

## 3. Claves Foráneas e Integridad Referencial

* **Clave Foránea (FK):** Atributo (o conjunto de atributos) en una tabla que referencia a la clave primaria (PK) de otra tabla para interconectar ambas estructuras relacionales[cite: 4].
* **Regla de Integridad Referencial:** Cualquier valor presente en una FK debe existir previamente como PK en la tabla referenciada, o ser nulo (si la relación lo admite)[cite: 4]. Su propósito es prevenir la aparición de registros huérfanos[cite: 4].

### Políticas ante Borrado o Modificación del Registro Padre
| Política | Acción ante eliminación o actualización del registro padre |
| :--- | :--- |
| **Restringir (*Restrict*)** | Bloquea y rechaza la operación si el registro tiene tuplas hijas vinculadas[cite: 4]. |
| **En Cascada (*Cascade*)** | Propaga la acción: al borrar o actualizar el padre, elimina o actualiza automáticamente las filas hijas[cite: 4]. |
| **Poner a Nulo (*Set Null*)** | Conserva los registros hijos, pero setea sus campos FK en valor `NULL`[cite: 4]. |
| **No hacer nada (*No Action*)** | Delega la verificación y control a los mecanismos por defecto del motor SGBD[cite: 4]. |

---

## 4. Restricciones del Modelo Físico

1. **Restricción de Dominio:** Cada atributo debe recibir un valor atómico compatible con su tipo de dato y rango permitido[cite: 4].
2. **Restricción de Clave Primaria:** Unicidad estricta; los identificadores no pueden repetirse[cite: 4].
3. **Integridad de Entidad:** Ningún atributo que forme parte de una clave primaria puede recibir un valor `NULL`[cite: 4].

---

## 5. Impacto de las Restricciones en Operaciones ABM

> [!WARNING] Control de Restricciones en Operaciones
> * **Altas (Insert):** Se rechazan si introducen claves primarias duplicadas, valores nulos en la clave primaria, claves foráneas inexistentes o tipos incompatibles con el dominio[cite: 4].
> * **Bajas (Delete):** Se bloquean o activan políticas si violan la **integridad referencial** por poseer registros dependientes en tablas hijas[cite: 4].
> * **Modificaciones (Update):** Al combinar inserción y baja, pueden vulnerar cualquiera de las restricciones anteriores (dominio, unicidad, nulidad o referencias cruzadas)[cite: 4].
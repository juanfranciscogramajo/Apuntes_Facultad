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
El mapeo de las interrelaciones conceptuales depende de su cardinalidad y cobertura, Toda tabla debe tener una clave primaria o una autoincremental :

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

* **Clave Foránea (FK):** Atributo (o conjunto de atributos) en una tabla que referencia a la clave primaria (PK) de otra tabla para interconectar ambas estructuras relacionales[cite: 4]. Puede ser de tipo de clave secundaria o univoca
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

## Pasos
- entidades a tablas, id tabla
- luego macar identificadores de la tabla, que se convierten en claves q puede ser primaria o candidata. Para elegirla si hay mas de una, la q sea mas simple
## Del modelo lógico (DER) al físico (relacional)

La idea es que el DER (entidades, relaciones, atributos) se convierte en **tablas**. Cada tabla tiene columnas (atributos), filas (tuplas), una **clave primaria (PK)** y, si hace falta, **claves foráneas (FK)**.

### 1. Cada entidad pasa a ser una tabla

- Los atributos de la entidad pasan a ser las columnas.
- Subrayás la **PK**. Si la entidad tiene más de un identificador posible, elegís uno solo y no armás una clave compuesta con los dos.
- Los atributos opcionales (0,1) se marcan con `?`.

Ejemplo: `Alumno = (dni, nombre, calle, nro, piso?, dpto?)`

### 2. Las relaciones: depende de la cardinalidad

Una relación puede ser una tabla propia o puede quedar absorbida como una FK en otra tabla. Esta es la tabla de decisión que sale de las diapositivas:

|Cardinalidades|Qué hacés|
|---|---|
|**(1,1) – (1,1)**|No hay tabla R. Ponés la FK en cualquiera de las dos tablas (a elección).|
|**(0,1) – (1,1)**|No hay tabla R. La FK va en la tabla del lado **(1,1)**. Ejemplo: `B = (idB, idA(fk), atB)`. Si la pusieras del lado (0,1) te quedarían nulos.|
|**(1,1) – (0,n) o (1,n)**|No hay tabla R. La FK va en la tabla del lado **(1,1)**, apuntando a la otra. Ejemplo: `A = (idA, idB(fk), atA)`.|
|**(0,1) – (0,1)**|Tabla R con `R = (idA(fk), idB(fk))`.|
|**(0,1) – (0,n) o (1,n)**|Tabla R con las dos FK.|
|**(0,n) o (1,n) – (0,n) o (1,n)**|Tabla R con las dos FK. La PK es la combinación de ambas.|

**Regla práctica:** si un lado es (1,1), la FK va ahí. Si hay un lado opcional (0,1) y no podés poner la FK sin generar nulos, o si es muchos a muchos, hacés una tabla aparte.

### 3. Casos especiales

- **Atributos de la relación (atR):** van en la tabla R. Entran en la PK solo si el dominio lo exige. Por ejemplo, un empleado puede trabajar en la misma área en dos períodos distintos. Entonces la PK es `(empleado, área, fecha_inicio)`.
- **Relaciones reflexivas** (por ejemplo, correlativas entre materias): la tabla R tiene dos FK a la misma tabla, así que tenés que **renombrar** una. Ejemplo: `R = (Código_Materia(fk), Código_Materia_Correlativa(fk))`.
- **Atributos multivaluados** (como teléfono): pasan a tabla propia. Se crea una tabla del atributo y una tabla de la relación con las dos FK. En el ejemplo: `Telefono` y `posee`.
- **Jerarquías ya resueltas** (por ejemplo, Empleado → Docente / NoDocente): la tabla hija lleva **solo la PK del padre como FK**, más sus atributos propios. No copies todos los atributos del padre. Ejemplo: `Docente = (dni(fk))`.

### 4. Notación

- **PK**: subrayada. Si es compuesta, una sola línea continua debajo de todos los campos.
- **FK**: se marca con `(fk)`.
- **Opcional**: `?`.

### 5. Errores típicos (los que suelen restar puntos)

1. No marcar las PK.
2. Armar una PK compuesta porque había dos identificadores posibles, en vez de elegir uno.
3. Agregar un campo `id` innecesario.
4. Resolver mal las relaciones con cardinalidad opcional.
5. Usar PK no mínimas.
6. No subrayar la PK compuesta con una línea continua.
7. No marcar las FK, ni las de entidades ni las de relaciones.
8. Olvidarse de convertir alguna entidad o relación.
9. En jerarquías, copiar todos los atributos del padre en las hijas en vez de solo su clave.

### Checklist para resolver un ejercicio

1. Convertí cada entidad en una tabla y marcá la PK.
2. Recorré cada relación y mirá sus cardinalidades.
3. Decidí si la relación va como FK o como tabla.
4. Pasá los atributos multivaluados a tabla propia.
5. Resolvé las jerarquías: PK del padre como FK en las hijas.
6. Revisá que estén marcadas todas las PK y FK, y que no sobren campos `id`.
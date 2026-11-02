### 1. Colecciones en Java (`ArrayList`)

- **Características:** `ArrayList` (del paquete `java.util`) representa una colección lineal ordenada que crece dinámicamente, acepta elementos duplicados y brinda acceso posicional en tiempo constante indexado desde cero.
- **Inserción y eliminación:** Al agregar o eliminar elementos en posiciones intermedias, la lista desplaza automáticamente los elementos para no dejar espacios vacíos.
- **Tipado genérico y desacoplamiento:** Se define indicando el tipo de elementos entre `<>` (`List<T> items = new ArrayList<T>();`). Declarar la variable con la interfaz `List` permite desacoplar el código de la implementación concreta.
- Protocolo de mensajes principales:
    - `add(object)` / `add(index, object)`: Agrega al final o en una posición específica desplazar elementos.
    - `get(index)`: Devuelve el elemento en dicha posición sin removerlo.
    - `size()`: Retorna la cantidad de elementos.
    - `contains(object)`: Verifica si el objeto existe en la lista.
    - `remove(index)`: Elimina el elemento en esa posición ajustando los índices posteriores
    - `clear()` y `isEmpty()`: Vacía la lista o consulta si está vacía.
### 2. Expresiones Lambda

- **Concepto:** Introducidas en Java 8, son funciones anónimas que no pertenecen a ninguna clase. Se utilizan principalmente para enviar comportamiento como parámetro a funciones de alto orden. 
- **Sintaxis:** `(parámetros) -> { cuerpo }`.
    - **Parámetros:** Los paréntesis son opcionales con un solo parámetro, pero obligatorios si no hay parámetros o si son dos o más separados por coma.
    - **Cuerpo:** Si consta de una sola línea, no requiere llaves ni la cláusula `return`. Si tiene múltiples líneas, exige el uso de llaves y especificar `return` explícitamente.
### 3. API Stream

Permite procesar colecciones mediante el encadenamiento de operaciones para filtrar, buscar, transformar, ordenar o calcular datos de manera declarativa.
#### Clasificación de Operaciones
1. **Operaciones Intermedias:** Retornan un nuevo `Stream`, lo que permite encadenar múltiples transformaciones antes del resultado final.
    - `filter(predicado)`: Filtra elementos según una condición lógica (ej. obtener alumnos con ingreso mayor a 2020).
    - `map(función)` / `mapToInt` / `mapToDouble`: Reemplaza cada elemento por el resultado de aplicar una función sobre él (ej. obtener lista de nombres o transformar a stream primitivo).
    - `limit(n)`: Trunca el flujo dejando únicamente los primeros $n$ elementos.
    - `sorted(comparador)`: Ordena los elementos del flujo según un criterio (ej. ordenar alumnos por promedio).
2. **Operaciones Terminales:** Cierran la tubería de ejecución del stream y retornan un tipo concreto de resultado (`List`, `long`, `double`, `Optional` o `void`).
    - `collect(Collectors.toList())`: Transforma el flujo resultante en una lista de Java.
    - `count()`: Retorna la cantidad total de elementos (`long`).
    - `sum()`: Suma todos los valores numéricos contenidos en streams primitivos (`IntStream`, `DoubleStream`).
    - `average()`: Devuelve un objeto `Optional` con el promedio de los valores numéricos.
    - `findFirst()` / `findAny()`: Devuelve un `Optional` con el primer elemento o alguno que cumpla el criterio.
    - `max(comparador)` / `min(comparador)`: Devuelve un `Optional` con el elemento máximo o mínimo según el comparador.
    - `anyMatch` / `allMatch` / `noneMatch`: Evalúan condiciones booleanas sobre los elementos del flujo.
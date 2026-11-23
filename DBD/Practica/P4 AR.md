Operadores fundamentales
- **Selección (σ):** Filtra filas que cumplen una condición (equivale a `WHERE` en SQL).
- **Proyección (π):** Extrae columnas específicas y elimina filas duplicadas del resultado.
- **Unión (\(\cup \)):** Combina tuplas de dos relaciones compatibles sin duplicados.
- **Diferencia de conjuntos (-):** Devuelve las tuplas presentes en la primera relación pero no en la segunda.
- **Producto cartesiano (×):** Combina cada tupla de una relación con cada tupla de otra.
- **Renombrado (ρ):** Cambia el nombre de una relación o de sus atributos.
Operadores derivados y extensiones
- **Join (\(\Join \)):** Combina datos de dos tablas según una condición (theta join, equi join, natural join o outer join).
- **Intersección (\(\cap \)):** Obtiene las tuplas comunes a dos relaciones compatibles.
- **División (÷):** Encuentra tuplas de una relación que se relacionan con todas las de otra.
- **Agregación y agrupación:** Extensiones prácticas para funciones como `SUM`, `COUNT`, `AVG`, `MIN` y
1-1
π nombre, apellido, DNI, telefono, direccion(σ (dni > 278342380))
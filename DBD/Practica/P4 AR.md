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
- 
1-1)
π nombre, apellido, DNI, telefono, direccion(σ (DNI > 278342380)(Cliente))
1-2)
π nombre, apellido, DNI, telefono, direccion(σ (DNI > 26345920 ^ total <= 100000)(Cliente|x| Factura))
1-3) 
π nombre, apellido, DNI, telefono, direccion(Cliente |x| σ (fecha >= '01/01/2020' ^ fecha <= '31/12/2020')( Factura))
1-4)$$\pi_{\text{nombre, apellido, DNI, telefono, direccion}} \left( \text{Cliente} - \pi_{\text{idCliente, nombre, apellido, DNI, telefono, direccion}} \left( \text{Cliente} \bowtie \sigma_{\text{fecha} \ge \text{'01/01/2020'} \land \text{fecha} \le \text{'31/12/2020'}}(\text{Factura}) \right) \right)$$
1-5)
Compraron2020 <= π idCliente (σ fecha >= 01/01/2020 ^ fecha <= 31/12/2020(factura))
CompraronSin2020 <= π idCliente (σ fecha <= 01/01/2020 ^ fecha >= 31/12/2020(factura))
π nombre, apellido, DNI, telefono, direccion( Cliente |X| (ClienteSin2020 - Compraron2020))
1-6)
π nombreP, descripcion, precio, stock (Producto |x| (π idProducto (Producto) - π idProducto (Detalle)))
1-7)
productos <= π idCliente (σ nombreP = 'ProductoX'^fecha >= '01/01/2020' ^ fecha<= '31/12/2020'(Factura |X| Detalle |X| Producto))
clientes <= π idCliente (Cliente) - productos
πnombre, apellido, DNI, telefono, direccion (Cliente |X| Clientes)
1-8)
compraronA <= π idCliente (σ nombreP = 'Producto A'(Factura |X| Detalle |X| Producto))
compraronB <= π idCliente (σ nombreP = 'Producto B'(Factura |X| Detalle |X| Producto))
π nombre, apellido, DNI, telefono, direccion (Cliente |X| (compraronA - compraronB)) 
1-9)
facturasC <= π nroTicket (σ nombreP = 'Producto C'(Factura |X| Detalle |X| Producto))

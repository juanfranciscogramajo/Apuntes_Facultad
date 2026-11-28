SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM Cliente c
WHERE c.idCliente IN (
   SELECT f.idCliente
   FROM Factura f
   INNER JOIN Detalle d ON f.nroTicket = d.nroTicket
   INNER JOIN Producto p ON d.idProducto = p.idProducto
   WHERE p.nombreP = 'prod1'
)
AND c.idCliente IN (
   SELECT f.idCliente
   FROM Factura f
   INNER JOIN Detalle d ON f.nroTicket = d.nroTicket
   INNER JOIN Producto p ON d.idProducto = p.idProducto
   WHERE p.nombreP = 'prod2'
)
AND c.idCliente NOT IN (
   SELECT f.idCliente
   FROM Factura f
   INNER JOIN Detalle d ON f.nroTicket = d.nroTicket
   INNER JOIN Producto p ON d.idProducto = p.idProducto
   WHERE p.nombreP = 'prod3'
)

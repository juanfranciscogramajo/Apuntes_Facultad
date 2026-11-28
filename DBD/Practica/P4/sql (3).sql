SELECT f.nroTicket, f.total, f.fecha, f.hora, c.DNI
FROM Factura f, Cliente c
WHERE nroTicket IN  (
   SELECT f.nroTicket
   FROM Factura f
   INNER JOIN Cliente c ON c.idCliente = f.idCliente
   INNER JOIN Detalle d ON f.nroTicket = d.nroTicket
   INNER JOIN Producto p ON d.idProducto = p.idProducto
   WHERE p.nombreP = 'prod38'
)
OR nroTicket IN (
  SELECT f.nroTicket
  FROM Factura f
  WHERE fecha >= '2023-01-01' AND fecha < '2024-01-01' 
)

SELECT c.DNI, c.apellido, c.nombre
FROM Cliente c
INNER JOIN Factura f ON f.idCliente = c.idCliente
GROUP BY c.idCliente, c.idCliente, c.apellido, c.nombre
HAVING SUM(f.total) > 100000

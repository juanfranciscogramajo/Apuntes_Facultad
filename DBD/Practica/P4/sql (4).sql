SELECT f.nroTicket, f.total, f.fecha, f.hora
FROM Factura f 
INNER JOIN Cliente c ON c.idCliente = f.idCliente
WHERE c.nombre = 'Jorge' AND c.apellido = 'Perez' AND NOT EXISTS (
    SELECT * 
    FROM Detalle d
    INNER JOIN Producto p ON p.idProducto = d.idProducto
    WHERE d.nroTicket = f.nroTicket AND p.nombreP - 'Z'
    )

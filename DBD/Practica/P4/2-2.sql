SELECT DISTINCT p.DNI, p.nombre, p.apellido, p.fnac, l.nombreL
FROM Podador p
INNER JOIN Localidad  l ON l.codigoPostal = p.codigoPostalVive
INNER JOIN Poda po on po.DNI = p.DNI
WHERE po.fecha >= '2023/01/01' AND po.fecha < '2024/01/01'



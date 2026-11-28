SELECT a.especie, a.anios, a.calle, a.nro, l.nombreL
FROM Arbol a
INNER JOIN Localidad  l ON l.codigoPostal = a.codigoPostal
WHERE a.nroArbol IN (
   SELECT p.nroArbol
   FROM Poda p
   INNER JOIN Podador po ON po.DNI = p.DNI
   WHERE po.nombre = 'Juan' OR po.apellido = 'Perez'
)
AND a.nroArbol IN (
   SELECT p.nroArbol
   FROM Poda p
   INNER JOIN Podador po ON po.DNI = p.DNI
   WHERE po.nombre = 'Jose' OR po.apellido = 'Garcia'
)

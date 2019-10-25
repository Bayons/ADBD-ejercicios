-- 9: Puesto con mas sanciones.

SELECT c.nro, COUNT(*) AS sanciones
FROM Concesion c, Sancion s
WHERE c.cod = s.cod
	sanciones >= ALL (SELECT COUNT(*)
	FROM Concesion c1, Sancion s1
	GROUP BY c1.nro)
GROUP BY c.nro

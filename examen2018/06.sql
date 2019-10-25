-- 6: Los 5 titulares actuales (nombre) con más sanciones.

WITH NSanciones AS (SELECT t.nombre AS nombre, COUNT(*) AS num
	FROM Titular t, Concesion c, Sancion s
	WHERE t.dni = c.dni AND
		c.cod = s.cod AND
		c.fechaF IS NULL
	GROUP BY t.nombre
)
SELECT DISTINCT ns.nombre, ns.num
FROM NSanciones ns
WHERE 5 > (SELECT COUNT(*)
	FROM NSanciones ns1
	WHERE ns.num < ns1.num)
ORDER BY num DESC;

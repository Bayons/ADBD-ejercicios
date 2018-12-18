-- Contar el número de amigos de 'nivel dos' (amigos, y amigos de amigos)
--	de la persona 'X' (cuidado con no contar a la misma persona dos
--	veces)

WITH AmigosN2 AS (SELECT DISTINCT a.pid1 as pid1, a.pid2 as pid2
	FROM Amistad a
	WHERE a.pid1 <> a.pid2
	UNION
	SELECT DISTINCT a1.pid1 as pid1, a2.pid2 as pid2
	FROM Amistad a1, Amistad a2
	WHERE a1.pid2 = a2.pid1 AND
	a1.pid1 <> a2.pid2)
SELECT p.nombre, COUNT(*)
FROM AmigosN2 an2, Persona p
WHERE p.pid = an2.pid1 AND
	p.nombre = 'Paul Parker'
GROUP BY an2.pid1, p.pid
ORDER BY an2.pid1;

-- Obtener el ratio de cohesión de cada grupo (nro de enlaces entre
--	miembros / nro máximo de enlaces posibles entre los miembros)

WITH NEnlaces AS (
	SELECT m1.gid as gid, CAST(COUNT(*) AS DECIMAL) as amistades
	FROM Miembro m1, Miembro m2, Amistad a
	WHERE m1.gid = m2.gid AND
		a.pid1 = m1.pid AND
		a.pid2 = m2.pid
	GROUP BY m1.gid),
Tamaño AS (SELECT m.gid as gid, CAST(COUNT (*) AS DECIMAL) as miembros
	FROM Miembro m
	GROUP BY m.gid)
SELECT ne.gid, (ne.amistades/((t.miembros*(t.miembros-1))/2)) AS ratio
FROM NEnlaces ne, Tamaño t
WHERE ne.gid = t.gid
ORDER BY ratio DESC;

-- Encontrar a las 5 personas con mayor numero de amigos

-- SELECT a.pid1 as pid, COUNT(*) as amigos
--	FROM Amistad a
--	GROUP BY a.pid1
--	ORDER BY amigos DESC;

WITH cantAmigos AS (SELECT a.pid1 as pid, COUNT(*) as nAmigos
	FROM Amistad a
	GROUP BY a.pid1
	ORDER BY nAmigos DESC)
SELECT ca.pid as id, p.nombre as nombre
FROM cantAmigos ca, Persona p
WHERE 5 > (SELECT COUNT(*)
	FROM cantAmigos ca1
	WHERE ca.nAmigos < ca1.nAmigos) AND
	p.pid = ca.pid;

-- Seleccionar a la(s) persona(s) con más número de amigos

WITH NAmigos AS (SELECT a1.pid1 AS pid, COUNT(*) as amigos
	FROM Amistad a1
	GROUP BY a1.pid1)
SELECT p.nombre, na.amigos
FROM NAmigos na, Persona p
WHERE na.amigos >= ALL(SELECT na2.amigos
	FROM NAmigos na2) AND
	p.pid = na.pid;

-- Devolver el número de amigos de cada persona (nombre)

SELECT P.nombre, P.pid, COUNT(*)
FROM Amistad A, Persona P
WHERE P.pid = A.pid1
GROUP BY P.pid
ORDER BY P.nombre;

-- Obtener los nombres de las personas que no han realizado ninguna
--	entrada de estado

SELECT p.nombre, p.pid
FROM Persona p
WHERE p.pid NOT IN (SELECT e.pid
	FROM Estado e);

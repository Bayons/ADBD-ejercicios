-- 5: Titulares (nombre) actuales sin ninguna sanción en sus concesiones
--	actuales.

SELECT DISTINCT t.nombre
FROM Titular t, Concesion c
WHERE t.dni = c.dni AND
	c.cod NOT IN (SELECT c1.cod
		FROM Sancion s, Concesion c1
		Where s.cod = c1.cod
	);

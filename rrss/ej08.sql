-- Encontrar a los dos personas que hayan nacido con fechas más cercanas
--	(sin contar las que han nacido en la misma fecha)

-- SELECT p1.pid, p2.pid, (p1.f_nacim - p2.f_nacim) AS dias
-- FROM Persona p1, Persona p2
-- WHERE (p1.f_nacim - p2.f_nacim) > 0


WITH DiasDif AS (
	SELECT p1.pid AS pid1, p2.pid AS pid2,
		(p1.f_nacim - p2.f_nacim) AS dias
	FROM Persona p1, Persona p2
	WHERE (p1.f_nacim - p2.f_nacim) > 0
	ORDER BY dias )
SELECT	p1.nombre AS nombre1, p1.f_nacim AS nacimiento1,
	p2.nombre AS nombre2, p2.f_nacim AS nacimiento2,
	dd.dias AS diferencia
FROM DiasDif dd, Persona p1, Persona p2
WHERE dd.dias <= ALL (
		SELECT dd1.dias
		FROM DiasDif dd1) AND
	p1.pid = dd.pid1 AND
	p2.pid = dd.pid2;

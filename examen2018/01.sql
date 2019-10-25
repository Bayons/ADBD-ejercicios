-- 1: Titulares (nombre) con licencias activas

SELECT DISTINCT t.nombre
FROM Concesion c, Titular t
WHERE c.dni = t.dni AND
	c.fechaF IS NOT NULL;

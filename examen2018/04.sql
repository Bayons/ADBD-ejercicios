-- 4: Número de licencias que ha tenido cada puesto, sin incluir las
--	activas.

SELECT c.nro, COUNT(*)
FROM Concesion c
WHERE c.fechaF IS NOT NULL
GROUP BY c.nro
ORDER BY c.nro;

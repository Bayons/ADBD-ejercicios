-- 3:  Número de licencias que ha tenido cada puesto, incluyendo las
--	activas.

SELECT c.nro, COUNT(*)
FROM Concesion c
GROUP BY c.nro
ORDER BY c.nro;

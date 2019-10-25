-- 8: Titulares con sancion en el año 2011.

SELECT c.dni
FROM Concesion c, Sancion s
WHERE c.cod = s.cod AND
	'2011' = EXTRACT(YEAR FROM s.fecha)

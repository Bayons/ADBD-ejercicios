-- Encontrar todos los vuelos (vuelo-día) vacíos
-- Seriously?

SELECT V.vid, F.fecha
FROM Vuelo V, (SELECT DISTINCT E.fecha
	FROM Embarque E) F
WHERE (V.vid,F.fecha) NOT IN (SELECT E.vid, E.fecha
FROM Embarque E);

-- Pares origen-destino (apids) con al menos 2 vuelos, ordenado por nº
--	de vuelos

WITH VRepetidos AS(SELECT origen, destino, COUNT(*) AS repeticiones
	FROM Vuelo
	GROUP BY origen, destino)
SELECT VR.origen, VR.destino, VR.repeticiones
FROM VRepetidos VR
WHERE VR.repeticiones >= 2
ORDER BY VR.repeticiones DESC;

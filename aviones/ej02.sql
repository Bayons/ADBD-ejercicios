-- Número de vuelos de la compañía ‘Qantas’
--	>> COPIADO EN CLASE

SELECT A.nombre, COUNT(*) AS numVuelos
FROM Aerolinea A, Vuelo V
WHERE A.alid = V.alid AND
	A.nombre = 'Qantas';

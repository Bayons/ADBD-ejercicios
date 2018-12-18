-- Encontrar todos los vuelos (vuelo-dia) vacios: vuelos que no tengan
--	pasajeros.

SELECT V.vid as Vuelos_Vacios
FROM Vuelo V
WHERE V.vid <> ALL (SELECT E.vid
	FROM Embarque E);

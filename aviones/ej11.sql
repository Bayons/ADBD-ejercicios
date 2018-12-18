-- Lista ordenada de aeropuertos y su rango; rango=nº total de vuelos con
-- origen en el aeropuerto; si dos empatan deben tener el mismo rango, y
-- el siguiente número no aparecer

-- Para tener mas variedad, cambiar origen por destino

-- Rango
SELECT V.destino, COUNT(*) as nVuelos
FROM Vuelo V
GROUP BY V.destino;

-- Lista ordenada por rango
WITH NVuelos AS (SELECT V.destino AS apid, COUNT(*) as nVuelos
	FROM Vuelo V
	GROUP BY apid)
SELECT NV.apid, NV.nVuelos, (SELECT COUNT(*)+1
	FROM NVuelos NV2
	WHERE NV2.nVuelos > NV.nVuelos) AS rango
FROM NVuelos NV
ORDER BY rango desc;

-- Compañía (alid) con el máximo número de vuelos
--	>> COPIADO EN CLASE

WITH NVuelos AS (SELECT V.alid AS alid, COUNT(*) AS vuelos
        FROM Vuelo V
        GROUP BY V.alid)
SELECT DISTINCT NV.alid, NV.vuelos
FROM NVuelos NV
WHERE NV.vuelos >= ALL(SELECT vuelos
    FROM NVuelos);

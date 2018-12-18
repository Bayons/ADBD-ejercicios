-- 5 compañías con el mayor número de vuelos
--	>> COPIADO EN CLASE

WITH NVuelos AS (SELECT V.alid, count(*) as nvu
	FROM Vuelo V
	GROUP BY V.alid)
SELECT NV.alid as alid, NV.nvu
FROM NVuelos NV
WHERE 5 > (SELECT COUNT(*)
	FROM NVuelos NV2
	WHERE NV2.nvu > NV.nvu);

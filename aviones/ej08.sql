-- Compañía con el máximo número de viajeros
-- OJO! No estoy mirando la compañia con el maximo numero de viajeros EN
--	UN VUELO, estoy mirando la compañia con el maximo numero de
--	clientes que TIENEN SU TARJETA

WITH ViajerosCompania AS (SELECT tarjAlid, COUNT(*) AS nViajeros
	FROM Cliente
	GROUP BY tarjAlid)
SELECT VC.tarjAlid AS Compania, VC.nViajeros
FROM ViajerosCompania VC
WHERE VC.nViajeros >= ALL (SELECT VC2.nViajeros
	FROM ViajerosCompania VC2);

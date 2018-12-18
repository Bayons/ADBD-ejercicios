-- Personas (cid, nombre) que han viajado en su cumpleaños
-- Pista: utilizar extract(<day|month|year> from c.fdn)

SELECT DISTINCT C.cid AS Id, C.nombre AS Nombre, C.fdn as Cumpleaños
FROM Cliente C, Embarque E
WHERE C.cid = E.cid AND
	EXTRACT(MONTH FROM C.fdn) = EXTRACT(MONTH FROM E.fecha) AND
	EXTRACT(DAY FROM C.fdn) = EXTRACT(DAY FROM E.fecha);

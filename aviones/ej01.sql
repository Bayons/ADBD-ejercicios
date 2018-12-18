-- Todos los vuelos realizados por 'García'
--	>> COPIADO EN CLASE

SELECT DISTINCT C.nombre, E.vid
FROM Cliente C, Embarque E
WHERE E.cid = C.cid and
	C.nombre = "García";

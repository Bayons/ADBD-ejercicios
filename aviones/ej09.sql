-- Personas (cid, nombre) que no tienen tarjeta de Qantas, pero es en la
--	que más han viajado

-- Numero de veces que ha viajado cada cliente en cada compañía
SELECT E.cid, V.alid, COUNT(*) AS nVuelos
FROM Embarque E, Vuelo V
WHERE E.vid = V.vid
GROUP BY E.cid, V.alid;

-- Compañia con la que más ha viajado cada cliente
WITH VuelosPorCompania AS (SELECT E.cid, V.alid, COUNT(*) AS nVuelos
	FROM Embarque E, Vuelo V
	WHERE E.vid = V.vid
	GROUP BY E.cid, V.alid)
SELECT VPC.cid, VPC.alid, VPC.nVuelos
FROM VuelosPorCompania VPC
WHERE VPC.nVuelos >= ALL (SELECT VPC2.nVuelos 
	FROM VuelosPorCompania VPC2
	WHERE VPC2.cid = VPC.cid)
ORDER BY VPC.cid;

-- Compañia con la que más ha viajado cada cliente, pero solo Qantas y sin
--	tarjeta Qantas (he omitido la tabla aerolinea porque son dos
--	lineas mas y el profesor no lo hace)
WITH VuelosPorCompania AS (SELECT E.cid, V.alid, COUNT(*) AS nVuelos
	FROM Embarque E, Vuelo V
	WHERE E.vid = V.vid
	GROUP BY E.cid, V.alid)
SELECT VPC.cid, C.nombre, VPC.nVuelos
FROM VuelosPorCompania VPC, Cliente C
WHERE C.cid = VPC.cid AND
	VPC.nVuelos >= ALL (SELECT VPC2.nVuelos 
	FROM VuelosPorCompania VPC2
	WHERE VPC2.cid = VPC.cid) AND
	VPC.alid = '01QA' AND
	C.tarjAlid <> '01QA';

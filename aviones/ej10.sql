-- Personas que visitaron más ciudades en un periodo (fini,ffin)
-- fini = '2011/04/12'
-- ffin = '2011/04/15'

-- Numero de ciudades visitadas por cada persona
SELECT E.cid, COUNT(DISTINCT A.ciudad) AS nCiudades
FROM Embarque E, Vuelo V, Aeropuerto A
WHERE E.vid = V.vid AND
	(V.origen = A.apid OR V.destino = A.apid)
GROUP BY E.cid;

-- Persona que visitó más ciudades
WITH cVisitadas AS(SELECT E.cid, COUNT(DISTINCT A.ciudad) AS nCiudades
	FROM Embarque E, Vuelo V, Aeropuerto A
	WHERE E.vid = V.vid AND
		(V.origen = A.apid OR V.destino = A.apid)
	GROUP BY E.cid)
SELECT CV.cid, CV.nCiudades
FROM cVisitadas CV
WHERE CV.nCiudades >= ALL (SELECT CV2.nCiudades
	FROM cVisitadas CV2);

-- Persona que visitó más ciudades en el rango de tiempo
WITH cVisitadas AS(SELECT E.cid, COUNT(DISTINCT A.ciudad) AS nCiudades
	FROM Embarque E, Vuelo V, Aeropuerto A
	WHERE E.vid = V.vid AND
		E.fecha >= '2011/04/12' AND
		E.fecha <= '2011/04/15' AND
		(V.origen = A.apid OR V.destino = A.apid)
	GROUP BY E.cid)
SELECT CV.cid, CV.nCiudades
FROM cVisitadas CV
WHERE CV.nCiudades >= ALL (SELECT CV2.nCiudades
	FROM cVisitadas CV2);

-- 7: Historial de todos los puestos(nro, fechaI, fechaF, nombre_titular)
--	ordenado en orden descendente por número de Puesto y en orden
--	ascendente por fechaI ( los puestos están numerados del 1 al 10).

SELECT c.nro, c.fechaI, c.fechaF, t.nombre
FROM Concesion c, Titular t
WHERE c.dni = t.dni
ORDER BY c.nro DESC, c.fechaI;

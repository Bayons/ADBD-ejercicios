-- Para cada persona que haya actualizado al menos dos veces el estado,
--	determinar el tiempo en que han ocurrido esas actualizaciones

WITH nEstados AS (SELECT e.pid as pid, COUNT(*) as num
	FROM Estado e
	GROUP BY e.pid),
PrimerEstado AS (SELECT e.pid as pid, e.f_modif as fecha
	FROM Estado e
	WHERE e.f_modif >= ALL(SELECT e1.f_modif
		FROM Estado e1
		WHERE e.pid = e1.pid)),
UltimoEstado AS (SELECT e.pid as pid, e.f_modif as fecha
	FROM Estado e
	WHERE e.f_modif <= ALL(SELECT e1.f_modif
		FROM Estado e1
		WHERE e.pid = e1.pid))
SELECT e.pid, pe.fecha, ue.fecha, (pe.fecha - ue.fecha) as dias
FROM nEstados e, PrimerEstado pe, UltimoEstado ue
WHERE e.pid = pe.pid AND
	pe.pid = ue.pid AND
	ue.pid = e.pid AND
	e.num >= 2;

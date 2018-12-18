-- Para cada persona que haya actualizado al menos dos veces el estado,
--	determinar el tiempo en que han ocurrido esas actualizaciones

select T.pid, (T.fult-T.fpri) as tiempo
from ( select E.pid,max(E.f_modif) as fult,
	min(E.f_modif) as fpri
	from Estado E
	group by E.pid
	having count(*)>1 ) T;

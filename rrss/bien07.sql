-- Obtener el ratio de cohesión de cada grupo (nro de enlaces entre
--	miembros / nro máximo de enlaces posibles entre los miembros)

select GE.gid, GE.ne/(GM.nme*(GM.nme-1)/2) as ratio
from(	select M1.gid, CAST(count(*)/2 AS DECIMAL) as ne
	from Miembro M1, Miembro M2
	where M1.gid=M2.gid and
	(M1.pid,M2.pid) in ( select * from Amistad)
	group by M1.gid
) GE,
(	select M.gid, CAST(count(*) AS DECIMAL) as nme
	from Miembro M
	group by M.gid
) GM
where GE.gid=GM.gid
order by ratio DESC;

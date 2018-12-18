-- Compañía con el máximo número de viajeros

with Nviajeros as (
	select V.alid, count(distinct E.cid) as nvi
	from Vuelo V, Embarque E
	where V.vid=E.vid
	group by V.alid)
select NV.alid, NV.nvi
from Nviajeros NV
where NV.nvi >= ALL (select NV2.nvi from Nviajeros NV2);

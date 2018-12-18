-- Personas (cid,nombre) que no tienen tarjeta de Qantas, pero es en la
--	que más han viajado

with NVuelos as (
	select E.cid, V.alid, count(*) as nvu
	from Vuelo V NATURAL JOIN Embarque E
	group by E.cid, V.alid )
select C.cid, C.nombre
from Cliente C, NVuelos NV
where C.cid=NV.cid and
	NV.nvu >= ALL (select NV2.nvu
		from NVuelos NV2
		where NV2.cid = NV.cid) and
	NV.alid = '01QA' and
	C.tarjAlid <> '01QA';

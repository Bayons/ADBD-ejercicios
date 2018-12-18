-- Personas que visitaron más ciudades en un periodo (fini,ffin)

with APVisitados as (
	select distinct E.cid, AP.ciudad
	from Embarque E, Vuelo V, Aeropuerto AP
	where E.vid=V.vid and
	E.fecha>='2011/04/12' and
	E.fecha<='2011/04/15' and
	(V.origen=AP.apid OR V.destino=AP.apid) ),
NCiudades as (
	select APV.cid, count(*) as nciu
	from APVisitados APV
	group by APV.cid )
select NC.cid, NC.nciu
from NCiudades NC
where NC.nciu >= ALL (select NC2.nciu
	from NCiudades NC2);

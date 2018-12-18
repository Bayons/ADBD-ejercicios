-- Lista ordenada de aeropuertos y su rango; rango=nº total de vuelos con
-- origen en el aeropuerto; si dos empatan deben tener el mismo rango, y
-- el siguiente número no aparecer

-- Para mayor variedad se esta utilizando destino en vez de origen

with NVuelos as (
	select V.destino as apid, count(*) as nvu
	from Vuelo V
	group by V.destino )
select NV.apid, NV.nvu, (
	select count(*)+1
	from NVuelos NV2
	where NV2.nvu > NV.nvu) as ranking
from NVuelos NV
order by ranking desc;

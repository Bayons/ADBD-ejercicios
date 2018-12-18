-- Encontrar a los dos personas que hayan nacido con fechas más cercanas
--	(sin contar las que han nacido en la misma fecha)

with Difs as (
	select P1.nombre as nom1, P2.nombre as nom2,
		abs(P1.f_nacim - P2.f_nacim) as dif
	from Persona P1, Persona P2
	where P1.pid<>P2.pid and abs(P1.f_nacim - P2.f_nacim)>0 )
select DF.nom1,DF.nom2
from Difs DF
where DF.dif = ( select min(DF2.dif)
from Difs DF2
);

-- Seleccionar a la(s) persona(s) con más número de amigos

with NAmigos as
(select A.pid1 as pid, count(*) as nam
from Amistad A
group by A.pid1)
select P.nombre, NA.nam
from Persona P, Namigos NA
where P.pid = NA.pid and
NA.nam = (select max(NA2.nam)
from NAmigos NA2);

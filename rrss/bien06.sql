-- Encontrar a las 5 personas con mayor numero de amigos

with NAmigos as (
select P.nombre, count(*) as nam
from Persona P, Amistad A
where P.pid=A.pid1
group by P.pid )
select NA.nombre,NA.nam
from NAmigos NA
where 5 > ( select count(*)
from NAmigos NA2
where NA2.nam > NA.nam
);

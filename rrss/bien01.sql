-- Devolver el número de amigos de cada persona (nombre)

select P.nombre,count(*)
from Persona P, Amistad A
where P.pid=A.pid1
group by P.pid;

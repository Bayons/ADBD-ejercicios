-- Contar el número de amigos de 'nivel dos' (amigos, y amigos de amigos)
--	de la persona 'X' (cuidado con no contar a la misma persona dos
--	veces)

select count(*)-1
from (
(select P.pid, A2.pid2
from Persona P, Amistad A1, Amistad A2
where P.pid=A1.pid1 and A1.pid2=A2.pid1  and
P.nombre like 'Joseph Nelson%'
)
union
(select P.pid, A1.pid2
from Persona P, Amistad A1
where P.pid=A1.pid1 and
P.nombre like 'Joseph Nelson%'
)
) red1y2;

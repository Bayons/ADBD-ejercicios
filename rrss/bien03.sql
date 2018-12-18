-- Obtener los nombres de las personas que no han realizado ninguna
--	entrada de estado

select P.nombre
from Persona P
where P.pid not in (select E.pid
from Estado E);

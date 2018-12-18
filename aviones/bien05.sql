-- Pares origen-destino (apids) con al menos 2 vuelos, ordenado por nº
-- vuelos

select V.origen, V.destino, count(*) as nvu
from Vuelo V
group by V.origen, V.destino
having count(*)>=2
order by nvu desc

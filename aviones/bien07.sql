-- Personas (cid,nombre) que han viajado en su cumpleaños
-- Pista: utilizar extract(<day|month|year> from c.fdn)

select distinct C.cid, C.nombre
from Cliente C, Embarque E
where E.cid=C.cid and
extract(day from E.fecha) = extract(day from C.fdn) and
extract(month from E.fecha) = extract(month from C.fdn);

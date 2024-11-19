-- 1. Mostrar todos los animales que viven en el habitat Santuario de aves tropicales
SELECT A.nombre AS animales
FROM animales A
INNER JOIN habitat H ON A.idhabitat = H.ID
WHERE H.nombre = 'Santuario de aves tropicales';
-- 2. Mostrar el nombre del cuidador, con el alias cuidador, ordenados alfabeticamente.
SELECT CONCAT('Cuidador ', C.nombre) AS cuidador
FROM cuidador C
ORDER BY C.nombre ASC;
-- 3. Mostrar el nombre y el ID de la especie, de los animales que viven en
--  Reserva de fauna
SELECT E.nombre AS especie, E.ID AS id_especie
FROM animales A
INNER JOIN especie E ON A.idespecie = E.ID
INNER JOIN habitat H ON A.idhabitat = H.ID
WHERE H.nombre = 'Reserva de fauna';
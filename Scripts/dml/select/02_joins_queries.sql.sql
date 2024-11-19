-- INNER JOIN
-- Mostrar el nombre comun de la familia y el estado de conservacion de la especie Delfín.
SELECT  E.nombre as especie,
		EC.nombre as estado_conservacion,
		FA.nombrecomun
FROM especie E
INNER JOIN estado_conservacion EC  on E.idestadoconservacion=EC.ID
INNER JOIN familia FA on E.idfamilia=FA.ID
where E.nombre like 'Delfín%';
SELECT * FROM especie;
--INNER JOIN: Listar animales con el nombre de su cuidador y el hábitat en el que viven.
SELECT  A.nombre as animales,
		C.nombre as cuidador,
		H.nombre as habitat
FROM animales A
INNER JOIN cuidador C  on A.idcuidador=C.ID
INNER JOIN habitat H on A.idhabitat=H.ID;
-- LEFT JOIN: Listar todos los animales, incluyendo aquellos que no tienen hábitat asignado.
SELECT A.nombre AS nombre, 
	   H.nombre AS habitat
FROM animales A
LEFT JOIN habitat H ON A.idhabitat = H.ID;
-- RIGHT JOIN: Listar todos los cuidadores y los animales que tienen asignados, 
--incluyendo cuidadores que no tienen animales a su cargo.
SELECT C.nombre AS nombre, 
       A.nombre AS nombre
FROM animales A
RIGHT JOIN cuidador C ON A.idcuidador = C.ID;
--FULL JOIN: Listar todas las especialidades y los cuidadores que las poseen, 
--incluyendo especialidades que no están asignadas a ningún cuidador y cuidadores sin especialidad.
SELECT E.nombre AS especialidad, 
       C.nombre AS nombre
FROM especialidad E
FULL JOIN cuidador C ON E.id = C.idespecialidad;
--SELF JOIN: Encontrar pares de animales que están bajo el mismo cuidador.
SELECT A1.nombre AS animal_1, 
       A2.nombre AS animal_2, 
       C.nombre AS cuidador
FROM animales A1
INNER JOIN animales A2 ON A1.idcuidador = A2.idcuidador AND A1.ID <> A2.ID
INNER JOIN cuidador C ON A1.idcuidador = C.ID
ORDER BY C.nombre, A1.nombre, A2.nombre;





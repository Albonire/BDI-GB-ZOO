SELECT  E.nombre as especie,
		EC.nombre as estado_conservacion,
		FA.nombrecomun
FROM especie E
INNER JOIN estado_conservacion EC  on E.idestadoconservacion=EC.ID
INNER JOIN familia FA on E.idfamilia=FA.ID
where E.nombre like 'Delfín%';
SELECT * FROM especie;

SELECT  A.nombre as animales,
		C.nombre as cuidador,
		H.nombre as habitat
FROM animales A
INNER JOIN cuidador C  on A.idcuidador=C.ID
INNER JOIN habitat H on A.idhabitat=H.ID;

SELECT A.nombre AS nombre, 
	   H.nombre AS habitat
FROM animales A
LEFT JOIN habitat H ON A.idhabitat = H.ID;

SELECT C.nombre AS nombre, 
       A.nombre AS nombre
FROM animales A
RIGHT JOIN cuidador C ON A.idcuidador = C.ID;

SELECT E.nombre AS especialidad, 
       C.nombre AS nombre
FROM especialidad E
FULL JOIN cuidador C ON E.id = C.idespecialidad;

SELECT A1.nombre AS animal_1, 
       A2.nombre AS animal_2, 
		A1.idcuidador
FROM animales A1
INNER JOIN animales A2 ON a1.idcuidador = A2.idcuidador
where A1.ID<> A2.ID
AND A1.idcuidador=1;





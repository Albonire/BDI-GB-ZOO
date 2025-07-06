SET client_encoding = 'UTF8';

INSERT INTO animals.animales (nombre, fecha_nacimiento, cuidador_id, habitat_id, especie_id) VALUES

-- Reptiles
('Nagini', '2020-03-18', (SELECT id FROM animals.cuidador WHERE nombre = 'María López'), (SELECT id FROM animals.habitat WHERE nombre = 'Cañón seco'), (SELECT id FROM animals.especie WHERE nombre = 'Cocodrilo Marino')),
('Saphira', '2020-05-12', (SELECT id FROM animals.cuidador WHERE nombre = 'María López'), (SELECT id FROM animals.habitat WHERE nombre = 'Cañón seco'), (SELECT id FROM animals.especie WHERE nombre = 'Cocodrilo del Nilo')),
('Mushu', '2019-07-30', (SELECT id FROM animals.cuidador WHERE nombre = 'Patricia Navarro'), (SELECT id FROM animals.habitat WHERE nombre = 'Cañón seco'), (SELECT id FROM animals.especie WHERE nombre = 'Gavial')),
('Kaa', '2018-04-21', (SELECT id FROM animals.cuidador WHERE nombre = 'Patricia Navarro'), (SELECT id FROM animals.habitat WHERE nombre = 'Cañón seco'), (SELECT id FROM animals.especie WHERE nombre = 'Caimán de Anteojos')),
('Scales', '2017-09-11', (SELECT id FROM animals.cuidador WHERE nombre = 'Patricia Navarro'), (SELECT id FROM animals.habitat WHERE nombre = 'Cañón seco'), (SELECT id FROM animals.especie WHERE nombre = 'Aligátor Americano')),

-- Mamíferos marinos
('Flipper', '2015-08-15', (SELECT id FROM animals.cuidador WHERE nombre = 'Ana Rivas'), (SELECT id FROM animals.habitat WHERE nombre = 'Reef coralino'), (SELECT id FROM animals.especie WHERE nombre = 'Delfín')),
('Splash', '2016-12-10', (SELECT id FROM animals.cuidador WHERE nombre = 'Daniela Méndez'), (SELECT id FROM animals.habitat WHERE nombre = 'Manglares costeros'), (SELECT id FROM animals.especie WHERE nombre = 'Tortuga Gigante de Galápagos')),
('Blue', '2017-11-22', (SELECT id FROM animals.cuidador WHERE nombre = 'Ana Rivas'), (SELECT id FROM animals.habitat WHERE nombre = 'Reef coralino'), (SELECT id FROM animals.especie WHERE nombre = 'Delfín')),
('Waves', '2018-05-30', (SELECT id FROM animals.cuidador WHERE nombre = 'Daniela Méndez'), (SELECT id FROM animals.habitat WHERE nombre = 'Manglares costeros'), (SELECT id FROM animals.especie WHERE nombre = 'Ballena')),
('Pearl', '2019-09-19', (SELECT id FROM animals.cuidador WHERE nombre = 'Ana Rivas'), (SELECT id FROM animals.habitat WHERE nombre = 'Reef coralino'), (SELECT id FROM animals.especie WHERE nombre = 'Foca')),

-- Aves
('Polly', '2021-04-11', (SELECT id FROM animals.cuidador WHERE nombre = 'Carlos Gómez'), (SELECT id FROM animals.habitat WHERE nombre = 'Santuario de aves tropicales'), (SELECT id FROM animals.especie WHERE nombre = 'Loro Gris Africano')),
('Sky', '2019-06-15', (SELECT id FROM animals.cuidador WHERE nombre = 'Francisco Herrera'), (SELECT id FROM animals.habitat WHERE nombre = 'Páramo de aves rapaces'), (SELECT id FROM animals.especie WHERE nombre = 'Kea')),
('Feather', '2018-08-08', (SELECT id FROM animals.cuidador WHERE nombre = 'Carlos Gómez'), (SELECT id FROM animals.habitat WHERE nombre = 'Santuario de aves tropicales'), (SELECT id FROM animals.especie WHERE nombre = 'Loro Amazónico')),
('Pico', '2020-10-20', (SELECT id FROM animals.cuidador WHERE nombre = 'Francisco Herrera'), (SELECT id FROM animals.habitat WHERE nombre = 'Páramo de aves rapaces'), (SELECT id FROM animals.especie WHERE nombre = 'Loro Gris Africano')),
('Echo', '2017-12-30', (SELECT id FROM animals.cuidador WHERE nombre = 'Carlos Gómez'), (SELECT id FROM animals.habitat WHERE nombre = 'Santuario de aves tropicales'), (SELECT id FROM animals.especie WHERE nombre = 'Guacamayo Rojo')),

-- Primates
('Koko', '2014-10-27', (SELECT id FROM animals.cuidador WHERE nombre = 'Pedro Sánchez'), (SELECT id FROM animals.habitat WHERE nombre = 'Reserva de fauna'), (SELECT id FROM animals.especie WHERE nombre = 'Chimpancé')),
('George', '2015-02-03', (SELECT id FROM animals.cuidador WHERE nombre = 'José García'), (SELECT id FROM animals.habitat WHERE nombre = 'Reserva de fauna'), (SELECT id FROM animals.especie WHERE nombre = 'Gorila de Montaña')),
('Caesar', '2016-02-28', (SELECT id FROM animals.cuidador WHERE nombre = 'Pedro Sánchez'), (SELECT id FROM animals.habitat WHERE nombre = 'Reserva de fauna'), (SELECT id FROM animals.especie WHERE nombre = 'Bonobo')),
('Jumbo', '2017-09-23', (SELECT id FROM animals.cuidador WHERE nombre = 'José García'), (SELECT id FROM animals.habitat WHERE nombre = 'Reserva de fauna'), (SELECT id FROM animals.especie WHERE nombre = 'Mandril')),
('Bobo', '2018-04-20', (SELECT id FROM animals.cuidador WHERE nombre = 'Pedro Sánchez'), (SELECT id FROM animals.habitat WHERE nombre = 'Reserva de fauna'), (SELECT id FROM animals.especie WHERE nombre = 'Babuino')),

-- Insectos
('Ziggy', '2023-04-15', (SELECT id FROM animals.cuidador WHERE nombre = 'Elena Martínez'), (SELECT id FROM animals.habitat WHERE nombre = 'Insectario tropical'), (SELECT id FROM animals.especie WHERE nombre = 'Mariposa Monarca')),
('Buzz', '2023-05-18', (SELECT id FROM animals.cuidador WHERE nombre = 'Elena Martínez'), (SELECT id FROM animals.habitat WHERE nombre = 'Insectario tropical'), (SELECT id FROM animals.especie WHERE nombre = 'Escarabajo Rinoceronte')),
('Flutter', '2021-09-23', (SELECT id FROM animals.cuidador WHERE nombre = 'Elena Martínez'), (SELECT id FROM animals.habitat WHERE nombre = 'Insectario tropical'), (SELECT id FROM animals.especie WHERE nombre = 'Mariposa Monarca')),
('Anty', '2020-04-15', (SELECT id FROM animals.cuidador WHERE nombre = 'Elena Martínez'), (SELECT id FROM animals.habitat WHERE nombre = 'Insectario tropical'), (SELECT id FROM animals.especie WHERE nombre = 'Hormiga Gigante')),
('Cricket', '2019-02-28', (SELECT id FROM animals.cuidador WHERE nombre = 'Elena Martínez'), (SELECT id FROM animals.habitat WHERE nombre = 'Insectario tropical'), (SELECT id FROM animals.especie WHERE nombre = 'Grillo')),

-- Otros mamíferos
('Kodiak', '2018-01-17', (SELECT id FROM animals.cuidador WHERE nombre = 'Laura Torres'), (SELECT id FROM animals.habitat WHERE nombre = 'Bosque de coníferas'), (SELECT id FROM animals.especie WHERE nombre = 'Oso Pardo')),
('Baloo', '2017-03-17', (SELECT id FROM animals.cuidador WHERE nombre = 'Laura Torres'), (SELECT id FROM animals.habitat WHERE nombre = 'Bosque de coníferas'), (SELECT id FROM animals.especie WHERE nombre = 'Oso Pardo')),
('Winnie', '2018-08-25', (SELECT id FROM animals.cuidador WHERE nombre = 'Laura Torres'), (SELECT id FROM animals.habitat WHERE nombre = 'Bosque de coníferas'), (SELECT id FROM animals.especie WHERE nombre = 'Oso Negro Americano')),
('Panda', '2016-11-15', (SELECT id FROM animals.cuidador WHERE nombre = 'Laura Torres'), (SELECT id FROM animals.habitat WHERE nombre = 'Bosque de coníferas'), (SELECT id FROM animals.especie WHERE nombre = 'Panda Gigante')),
('Grizzly', '2015-05-28', (SELECT id FROM animals.cuidador WHERE nombre = 'Laura Torres'), (SELECT id FROM animals.habitat WHERE nombre = 'Bosque de coníferas'), (SELECT id FROM animals.especie WHERE nombre = 'Oso Pardo')),

-- Animales nocturnos
('Twilight', '2021-09-11', (SELECT id FROM animals.cuidador WHERE nombre = 'Lucía Ortega'), (SELECT id FROM animals.habitat WHERE nombre = 'Refugio crepuscular'), (SELECT id FROM animals.especie WHERE nombre = 'Murciélago Vampiro')),
('Luna', '2019-12-25', (SELECT id FROM animals.cuidador WHERE nombre = 'Lucía Ortega'), (SELECT id FROM animals.habitat WHERE nombre = 'Refugio crepuscular'), (SELECT id FROM animals.especie WHERE nombre = 'Lince Boreal')),
('Shadow', '2020-10-31', (SELECT id FROM animals.cuidador WHERE nombre = 'Lucía Ortega'), (SELECT id FROM animals.habitat WHERE nombre = 'Refugio crepuscular'), (SELECT id FROM animals.especie WHERE nombre = 'Murciélago Vampiro')),
('Owliver', '2018-06-14', (SELECT id FROM animals.cuidador WHERE nombre = 'Lucía Ortega'), (SELECT id FROM animals.habitat WHERE nombre = 'Refugio crepuscular'), (SELECT id FROM animals.especie WHERE nombre = 'Lechuza')),
('Midnight', '2017-08-18', (SELECT id FROM animals.cuidador WHERE nombre = 'Lucía Ortega'), (SELECT id FROM animals.habitat WHERE nombre = 'Refugio crepuscular'), (SELECT id FROM animals.especie WHERE nombre = 'Lince Boreal')),

-- Elefantes
('Manny', '2019-06-02', (SELECT id FROM animals.cuidador WHERE nombre = 'Roberto Castro'), (SELECT id FROM animals.habitat WHERE nombre = 'Llanura de mamíferos'), (SELECT id FROM animals.especie WHERE nombre = 'Elefante Africano')),
('Dumbo', '2018-08-08', (SELECT id FROM animals.cuidador WHERE nombre = 'Sofía Morales'), (SELECT id FROM animals.habitat WHERE nombre = 'Llanura de mamíferos'), (SELECT id FROM animals.especie WHERE nombre = 'Elefante Asiático')),
('Babar', '2017-09-09', (SELECT id FROM animals.cuidador WHERE nombre = 'Roberto Castro'), (SELECT id FROM animals.habitat WHERE nombre = 'Llanura de mamíferos'), (SELECT id FROM animals.especie WHERE nombre = 'Elefante Africano')),
('Ella', '2018-12-12', (SELECT id FROM animals.cuidador WHERE nombre = 'Sofía Morales'), (SELECT id FROM animals.habitat WHERE nombre = 'Llanura de mamíferos'), (SELECT id FROM animals.especie WHERE nombre = 'Elefante Asiático')),
('Hathi', '2016-11-12', (SELECT id FROM animals.cuidador WHERE nombre = 'Roberto Castro'), (SELECT id FROM animals.habitat WHERE nombre = 'Llanura de mamíferos'), (SELECT id FROM animals.especie WHERE nombre = 'Elefante Africano')),

-- Felinos
('Simba', '2018-06-12', (SELECT id FROM animals.cuidador WHERE nombre = 'Juan Pérez'), (SELECT id FROM animals.habitat WHERE nombre = 'Territorio felino'), (SELECT id FROM animals.especie WHERE nombre = 'León')),
('Nala', '2018-07-21', (SELECT id FROM animals.cuidador WHERE nombre = 'Juan Pérez'), (SELECT id FROM animals.habitat WHERE nombre = 'Territorio felino'), (SELECT id FROM animals.especie WHERE nombre = 'León')),
('Raja', '2019-04-22', (SELECT id FROM animals.cuidador WHERE nombre = 'Luis Fernández'), (SELECT id FROM animals.habitat WHERE nombre = 'Territorio felino'), (SELECT id FROM animals.especie WHERE nombre = 'Tigre')),
('Shere Khan', '2017-12-25', (SELECT id FROM animals.cuidador WHERE nombre = 'Luis Fernández'), (SELECT id FROM animals.habitat WHERE nombre = 'Territorio felino'), (SELECT id FROM animals.especie WHERE nombre = 'Tigre')),
('Bagheera', '2017-11-05', (SELECT id FROM animals.cuidador WHERE nombre = 'Juan Pérez'), (SELECT id FROM animals.habitat WHERE nombre = 'Territorio felino'), (SELECT id FROM animals.especie WHERE nombre = 'Pantera')); 
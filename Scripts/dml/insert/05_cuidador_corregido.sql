SET client_encoding = 'UTF8';

INSERT INTO animals.cuidador (nombre, especialidad_id) VALUES
('Juan Pérez', (SELECT id FROM animals.especialidad WHERE nombre = 'Manejo de Grandes Felinos')),
('María López', (SELECT id FROM animals.especialidad WHERE nombre = 'Cuidados de Reptiles')),
('Carlos Gómez', (SELECT id FROM animals.especialidad WHERE nombre = 'Aves Exoticas')),
('Ana Rivas', (SELECT id FROM animals.especialidad WHERE nombre = 'Mamiferos Marinos')),
('Pedro Sánchez', (SELECT id FROM animals.especialidad WHERE nombre = 'Primates')),
('Laura Torres', (SELECT id FROM animals.especialidad WHERE nombre = 'Animales de Clima Frio')),
('Miguel Díaz', (SELECT id FROM animals.especialidad WHERE nombre = 'Animales en Peligro de Extincion')),
('Lucía Ortega', (SELECT id FROM animals.especialidad WHERE nombre = 'Animales Nocturnos')),
('Roberto Castro', (SELECT id FROM animals.especialidad WHERE nombre = 'Grandes Herbivoros')),
('Carmen Suárez', (SELECT id FROM animals.especialidad WHERE nombre = 'Manejo de Veneno y Antidotos')),
('Elena Martínez', (SELECT id FROM animals.especialidad WHERE nombre = 'Cuidados de Insectos')),
('Tomás Romero', (SELECT id FROM animals.especialidad WHERE nombre = 'Animales del Desierto')),
('Daniela Méndez', (SELECT id FROM animals.especialidad WHERE nombre = 'Acuario')),
('Javier Ruiz', (SELECT id FROM animals.especialidad WHERE nombre = 'Animales Domesticos')),
('Sofía Morales', (SELECT id FROM animals.especialidad WHERE nombre = 'Cria en Cautiverio')),
('Luis Fernández', (SELECT id FROM animals.especialidad WHERE nombre = 'Manejo de Grandes Felinos')),
('Patricia Navarro', (SELECT id FROM animals.especialidad WHERE nombre = 'Cuidados de Reptiles')),
('Francisco Herrera', (SELECT id FROM animals.especialidad WHERE nombre = 'Aves Exoticas')),
('Clara Jiménez', (SELECT id FROM animals.especialidad WHERE nombre = 'Mamiferos Marinos')),
('José García', (SELECT id FROM animals.especialidad WHERE nombre = 'Primates')); 
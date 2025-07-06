SET client_encoding = 'UTF8';

INSERT INTO animals.habitat (nombre, descripcion, ubicacion_id, clima_id) VALUES
-- Habitats tropicales
('Selva densa tropical', 'Selva tropical con vegetación densa y clima húmedo', (SELECT id FROM animals.ubicacion WHERE nombre = 'Zona Tropical'), (SELECT id FROM animals.clima WHERE nombre = 'Tropical')),
('Llanura africana', 'Sabana africana con pastizales y árboles dispersos', (SELECT id FROM animals.ubicacion WHERE nombre = 'Sabana Africana'), (SELECT id FROM animals.clima WHERE nombre = 'Tropical')),
('Humedal tropical', 'Zona húmeda con vegetación acuática', (SELECT id FROM animals.ubicacion WHERE nombre = 'Bosque Lluvioso'), (SELECT id FROM animals.clima WHERE nombre = 'Lluvioso')),

-- Habitats deserticos
('Desierto arenoso', 'Desierto con dunas de arena y clima extremadamente seco', (SELECT id FROM animals.ubicacion WHERE nombre = 'Zona Desertica'), (SELECT id FROM animals.clima WHERE nombre = 'Desertico')),
('Cañón seco', 'Cañón con clima árido y rocas', (SELECT id FROM animals.ubicacion WHERE nombre = 'Zona de Reptiles'), (SELECT id FROM animals.clima WHERE nombre = 'Arido')),

-- Habitats montañosos
('Pico nevado', 'Montaña con nieve permanente y clima alpino', (SELECT id FROM animals.ubicacion WHERE nombre = 'Zona de Montaña'), (SELECT id FROM animals.clima WHERE nombre = 'Alpino')),
('Bosque templado alto', 'Bosque de montaña con clima templado', (SELECT id FROM animals.ubicacion WHERE nombre = 'Zona de Montaña'), (SELECT id FROM animals.clima WHERE nombre = 'Templado')),

-- Habitats acuaticos
('Reef coralino', 'Arrecife de coral con vida marina diversa', (SELECT id FROM animals.ubicacion WHERE nombre = 'Acuario'), (SELECT id FROM animals.clima WHERE nombre = 'Marino')),
('Manglares costeros', 'Ecosistema de manglares en la costa', (SELECT id FROM animals.ubicacion WHERE nombre = 'Acuario'), (SELECT id FROM animals.clima WHERE nombre = 'Humedo')),

-- Aviarios
('Santuario de aves tropicales', 'Hábitat para aves tropicales coloridas', (SELECT id FROM animals.ubicacion WHERE nombre = 'Aviario'), (SELECT id FROM animals.clima WHERE nombre = 'Tropical')),
('Páramo de aves rapaces', 'Zona para aves rapaces en ambiente seco', (SELECT id FROM animals.ubicacion WHERE nombre = 'Aviario'), (SELECT id FROM animals.clima WHERE nombre = 'Seco')),

-- Habitats de clima frio
('Tundra ártica', 'Tundra ártica con clima polar extremo', (SELECT id FROM animals.ubicacion WHERE nombre = 'Habitat Artico'), (SELECT id FROM animals.clima WHERE nombre = 'Polar')),
('Bosque de coníferas', 'Bosque de pinos y abetos en clima frío', (SELECT id FROM animals.ubicacion WHERE nombre = 'Zona de Montaña'), (SELECT id FROM animals.clima WHERE nombre = 'Polar')),

-- Otros Habitats especificos
('Vivero tropical', 'Vivero con plantas tropicales', (SELECT id FROM animals.ubicacion WHERE nombre = 'Jardin Botanico'), (SELECT id FROM animals.clima WHERE nombre = 'Humedo')),
('Estepa continental', 'Estepa con clima continental', (SELECT id FROM animals.ubicacion WHERE nombre = 'Pradera'), (SELECT id FROM animals.clima WHERE nombre = 'Continental')),
('Refugio crepuscular', 'Hábitat para animales nocturnos', (SELECT id FROM animals.ubicacion WHERE nombre = 'Habitat Nocturno'), (SELECT id FROM animals.clima WHERE nombre = 'Nuboso')),
('Costa rocosa', 'Costa con rocas y clima marino', (SELECT id FROM animals.ubicacion WHERE nombre = 'Playa Artificial'), (SELECT id FROM animals.clima WHERE nombre = 'Marino')),

-- Zonas de exhibicion y conservacion
('Exhibición de biomas', 'Exhibición de diferentes biomas', (SELECT id FROM animals.ubicacion WHERE nombre = 'Area de Exhibicion'), (SELECT id FROM animals.clima WHERE nombre = 'Templado')),
('Reserva de fauna', 'Reserva para conservación de fauna', (SELECT id FROM animals.ubicacion WHERE nombre = 'Centro de Conservacion'), (SELECT id FROM animals.clima WHERE nombre = 'Templado')),

-- Areas especificas para grupos de animales
('Territorio felino', 'Hábitat especializado para grandes felinos', (SELECT id FROM animals.ubicacion WHERE nombre = 'Recinto de Grandes Felinos'), (SELECT id FROM animals.clima WHERE nombre = 'Tropical')),
('Insectario tropical', 'Hábitat para insectos tropicales', (SELECT id FROM animals.ubicacion WHERE nombre = 'Zona de Insectos'), (SELECT id FROM animals.clima WHERE nombre = 'Humedo')),
('Valle de aves', 'Valle especializado para aves', (SELECT id FROM animals.ubicacion WHERE nombre = 'Zona de Aves'), (SELECT id FROM animals.clima WHERE nombre = 'Lluvioso')),
('Llanura de mamíferos', 'Llanura para mamíferos terrestres', (SELECT id FROM animals.ubicacion WHERE nombre = 'Zona de Mamiferos'), (SELECT id FROM animals.clima WHERE nombre = 'Continental')); 
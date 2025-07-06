SET client_encoding = 'UTF8';

INSERT INTO animals.especie (nombre, descripcion, estado_conservacion_id) VALUES
-- Felidae
('León', 'Gran felino de la familia Felidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),
('Tigre', 'Gran felino de la familia Felidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'En peligro')),
('Jaguar', 'Gran felino de la familia Felidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Casi amenazado')),
('Leopardo', 'Gran felino de la familia Felidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),
('Pantera', 'Gran felino de la familia Felidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),
('Guepardo', 'Gran felino de la familia Felidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),

-- Canidae
('Lobo', 'Canido salvaje de la familia Canidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),
('Coyote', 'Canido salvaje de la familia Canidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),
('Zorro Rojo', 'Canido salvaje de la familia Canidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),
('Licaón', 'Canido salvaje de la familia Canidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'En peligro')),
('Perro Salvaje Africano', 'Canido salvaje de la familia Canidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'En peligro')),

-- Ursidae
('Oso Pardo', 'Gran oso de la familia Ursidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),
('Oso Polar', 'Gran oso de la familia Ursidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),
('Oso Negro Americano', 'Gran oso de la familia Ursidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),
('Panda Gigante', 'Gran oso de la familia Ursidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'En peligro')),
('Oso Perezoso', 'Gran oso de la familia Ursidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),

-- Cercopithecidae
('Babuino', 'Mono del viejo mundo de la familia Cercopithecidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),
('Macaco Rhesus', 'Mono del viejo mundo de la familia Cercopithecidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),
('Colobo Guereza', 'Mono del viejo mundo de la familia Cercopithecidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),
('Mandril', 'Mono del viejo mundo de la familia Cercopithecidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),
('Mono Gelada', 'Mono del viejo mundo de la familia Cercopithecidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Casi amenazado')),

-- Hominidae
('Gorila de Montaña', 'Gran simio de la familia Hominidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'En peligro critico')),
('Chimpancé', 'Gran simio de la familia Hominidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'En peligro')),
('Orangután de Borneo', 'Gran simio de la familia Hominidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'En peligro critico')),
('Ser Humano', 'Gran simio de la familia Hominidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),
('Bonobo', 'Gran simio de la familia Hominidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'En peligro')),

-- Elephantidae
('Elefante Africano', 'Gran mamifero de la familia Elephantidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),
('Elefante Asiático', 'Gran mamifero de la familia Elephantidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'En peligro')),
('Elefante de Selva Africano', 'Gran mamifero de la familia Elephantidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),

-- Psittacidae
('Guacamayo Rojo', 'Ave de la familia Psittacidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'En peligro')),
('Loro Amazónico', 'Ave de la familia Psittacidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),
('Kea', 'Ave de la familia Psittacidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Casi amenazado')),
('Loro Gris Africano', 'Ave de la familia Psittacidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'En peligro')),
('Periquito Común', 'Ave de la familia Psittacidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),

-- Testudinidae
('Tortuga Gigante de Galápagos', 'Reptil de la familia Testudinidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'En peligro critico')),
('Tortuga Sulcata', 'Reptil de la familia Testudinidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),
('Tortuga Gigante de Aldabra', 'Reptil de la familia Testudinidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),
('Tortuga de Gopher', 'Reptil de la familia Testudinidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Casi amenazado')),
('Tortuga Estrellada de Madagascar', 'Reptil de la familia Testudinidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'En peligro')),

-- Delphinidae
('Delfín', 'Mamifero marino de la familia Delphinidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),
('Orca', 'Mamifero marino de la familia Delphinidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),

-- Balaenopteridae
('Ballena', 'Mamifero marino de la familia Balaenopteridae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'En peligro critico')),

-- Phocidae
('Foca', 'Mamifero marino de la familia Phocidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'En peligro')),

-- Insectos
('Hormiga Gigante', 'Insecto de la familia Formicidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),
('Escarabajo', 'Insecto de la familia Coleoptera', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),
('Escarabajo Rinoceronte', 'Insecto de la familia Coleoptera', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),
('Abejorro', 'Insecto de la familia Apidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Casi amenazado')),
('Mariposa Monarca', 'Insecto de la familia Nymphalidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'En peligro')),
('Mariposa Azul', 'Insecto de la familia Nymphalidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Casi amenazado')),
('Grillo', 'Insecto de la familia Gryllidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),
('Luciérnaga', 'Insecto de la familia Lampyridae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),
('Avispa', 'Insecto de la familia Vespidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),

-- Animales Nocturnos
('Murciélago Vampiro', 'Mamifero nocturno de la familia Vespertilionidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),
('Lince Boreal', 'Felino nocturno de la familia Felidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),
('Lechuza', 'Ave nocturna de la familia Strigidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),
('Zorro Volador', 'Mamifero volador de la familia Pteropodidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),

-- Crocodylidae
('Cocodrilo Marino', 'Reptil de la familia Crocodylidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),
('Cocodrilo del Nilo', 'Reptil de la familia Crocodylidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),
('Crocodylus niloticus', 'Reptil de la familia Crocodylidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),
('Crocodylus porosus', 'Reptil de la familia Crocodylidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),
('Aligátor Americano', 'Reptil de la familia Crocodylidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Vulnerable')),
('Caimán de Anteojos', 'Reptil de la familia Crocodylidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'Preocupacion menor')),
('Gavial', 'Reptil de la familia Crocodylidae', (SELECT codigo FROM animals.estado_conservacion WHERE nombre = 'En peligro')); 
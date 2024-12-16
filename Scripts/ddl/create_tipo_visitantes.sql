-- Crear archivo: Scripts/ddl/create_tipo_visitantes.sql
CREATE TABLE animals.TIPO_VISITANTES (
    ID SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Descuento NUMERIC(5,2) NOT NULL
);

-- Insertar tipos de visitantes básicos
INSERT INTO animals.TIPO_VISITANTES (Nombre, Descuento) VALUES
('Regular', 0),
('Estudiante', 15),
('Adulto Mayor', 20),
('Niño', 25),
('Grupo Familiar', 10);
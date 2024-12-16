-- Crear el esquema si no existe
CREATE SCHEMA IF NOT EXISTS animals;

-- Crear las tablas en orden (por las dependencias)
CREATE TABLE IF NOT EXISTS animals.especialidad (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS animals.clima (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS animals.ubicacion (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS animals.estado_conservacion (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS animals.habitat (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200),
    clima_id INTEGER REFERENCES animals.clima(id),
    ubicacion_id INTEGER REFERENCES animals.ubicacion(id)
);

CREATE TABLE IF NOT EXISTS animals.especie (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200),
    habitat_id INTEGER REFERENCES animals.habitat(id),
    estado_conservacion_id INTEGER REFERENCES animals.estado_conservacion(id)
);

CREATE TABLE IF NOT EXISTS animals.cuidador (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    especialidad_id INTEGER REFERENCES animals.especialidad(id)
);

CREATE TABLE IF NOT EXISTS animals.animales (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    cuidador_id INTEGER REFERENCES animals.cuidador(id),
    habitat_id INTEGER REFERENCES animals.habitat(id)
);
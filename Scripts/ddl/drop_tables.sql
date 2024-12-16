-- Eliminar todas las tablas en orden correcto (por las dependencias)
DROP TABLE IF EXISTS animals.animales CASCADE;
DROP TABLE IF EXISTS animals.cuidador CASCADE;
DROP TABLE IF EXISTS animals.especie CASCADE;
DROP TABLE IF EXISTS animals.habitat CASCADE;
DROP TABLE IF EXISTS animals.clima CASCADE;
DROP TABLE IF EXISTS animals.ubicacion CASCADE;
DROP TABLE IF EXISTS animals.estado_conservacion CASCADE;
DROP TABLE IF EXISTS animals.especialidad CASCADE;

-- Eliminar el esquema
DROP SCHEMA IF EXISTS animals CASCADE; 
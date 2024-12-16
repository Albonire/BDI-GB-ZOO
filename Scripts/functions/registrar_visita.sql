-- Crear archivo: Scripts/functions/registrar_visita.sql

-- Primero eliminamos la versión anterior
DROP PROCEDURE IF EXISTS animals.registrar_visita(integer, integer, date);
DROP FUNCTION IF EXISTS animals.registrar_visita(integer, integer, date);

-- Ahora creamos la nueva función
CREATE OR REPLACE PROCEDURE animals.registrar_visita(
    p_habitat_id INTEGER,
    p_visitante_id INTEGER,
    p_fecha_visita DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_costo_base DECIMAL(10,2);
    v_descuento INTEGER;
BEGIN
    -- Obtener el costo base del hábitat
    SELECT costobase INTO v_costo_base
    FROM animals.HABITAT
    WHERE id = p_habitat_id;

    -- Obtener el descuento del tipo de visitante
    SELECT tv.descuento INTO v_descuento
    FROM animals.VISITANTES v
    JOIN animals.TIPO_VISITANTES tv ON v.idtipovisitante = tv.id
    WHERE v.id = p_visitante_id;

    -- Registrar la visita con el precio calculado
    INSERT INTO animals.HABITAT_VISITANTES (
        idhabitat,
        idvisitantes,
        fechavisita,
        costofinal
    ) VALUES (
        p_habitat_id,
        p_visitante_id,
        p_fecha_visita,
        v_costo_base * (1 - v_descuento/100.0)
    );
END;
$$;
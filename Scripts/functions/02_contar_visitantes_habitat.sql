-- Cuenta el número de visitantes que ha tenido un hábitat específico 
-- basado en su nombre. La función toma el nombre del hábitat como 
-- parámetro y devuelve la cantidad de visitantes.

CREATE OR REPLACE FUNCTION count_assistants_habitat(
    habitat_q VARCHAR
) 
RETURNS INT
LANGUAGE plpgsql
AS 
$$
DECLARE
   assistants_count INT; -- Variable para almacenar el resultado
BEGIN
   -- Contar visitantes para el hábitat especificado
   SELECT COUNT(HV.*)
   INTO assistants_count
   FROM HABITAT_VISITANTES HV
   INNER JOIN HABITAT H ON HV.IdHabitat = H.ID
   WHERE H.NOMBRE = habitat_q;

   -- Retornar el resultado
   RETURN assistants_count;
END;
$$;

#!/bin/bash

# Configura la codificación UTF-8
export LANG=en_US.UTF-8

# Configura las variables de conexión
PGHOST="localhost"
PGPORT="5432"
PGUSER="adminzoo"
PGPASSWORD="albonire21"
PGDATABASE="zoologico"

# Exporta la contraseña para que `psql` pueda usarla sin solicitarla
export PGPASSWORD

# Función para ejecutar cada archivo SQL y verificar errores
ejecutar_sql() {
    local archivo_sql=$1
    echo "Ejecutando $archivo_sql..."
    psql -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d "$PGDATABASE" -f "$archivo_sql"
    if [ $? -ne 0 ]; then
        echo "Error ejecutando $archivo_sql"
        exit 1
    fi
}

# Ejecuta cada archivo SQL en orden
ejecutar_sql "01_tablas_independientes.sql"
ejecutar_sql "02_habitat.sql"
ejecutar_sql "03_especies.sql"
ejecutar_sql "04_habitat_visitantes.sql"
ejecutar_sql "05_cuidador.sql"
ejecutar_sql "06_animales.sql"

echo "Todos los scripts SQL se ejecutaron correctamente."

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

# Ejecuta cada archivo SQL en orden
echo "Ejecutando TableDefinitions.sql..."
psql -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d "$PGDATABASE" -f "TableDefinitions.sql"
if [ $? -ne 0 ]; then
    echo "Error ejecutando TableDefinitions.sql"
    exit 1
fi

echo "Script ejecutado correctamente."

#!/usr/bin/env python3
"""
Script para inicializar la base de datos
Crea el esquema 'animals' y todas las tablas necesarias
"""

import os
import sys
from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker
from src.app.config import settings
from src.app.database.database import Base

# Importar todos los modelos para que SQLAlchemy los registre
from src.app.models import (
    AnimalesModel, CuidadorModel, EspecieModel, HabitatModel,
    FamiliaModel, EstadoConservacionModel, EspecialidadModel,
    UbicacionModel, ClimaModel
)

def init_database():
    """Inicializa la base de datos creando el esquema y las tablas"""
    
    # Crear el motor de la base de datos
    engine = create_engine(settings.database_url)
    
    try:
        # Crear una conexión
        with engine.connect() as connection:
            print("✅ Conectado a la base de datos")
            
            # Crear el esquema 'animals' si no existe
            connection.execute(text("CREATE SCHEMA IF NOT EXISTS animals"))
            connection.commit()
            print("✅ Esquema 'animals' creado/verificado")
            
            # Crear todas las tablas
            Base.metadata.create_all(bind=engine)
            print("✅ Todas las tablas creadas exitosamente")
            
            # Verificar que las tablas se crearon
            result = connection.execute(text("""
                SELECT table_name 
                FROM information_schema.tables 
                WHERE table_schema = 'animals'
                ORDER BY table_name
            """))
            
            tables = [row[0] for row in result]
            print(f"📋 Tablas creadas en el esquema 'animals': {', '.join(tables)}")
            
    except Exception as e:
        print(f"❌ Error al inicializar la base de datos: {e}")
        sys.exit(1)

if __name__ == "__main__":
    print("🚀 Inicializando base de datos...")
    init_database()
    print("🎉 Base de datos inicializada correctamente!") 
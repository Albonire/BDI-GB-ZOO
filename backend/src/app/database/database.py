# app/database/database.py
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from src.app.config import settings

# Configuración del motor de la base de datos usando settings
DATABASE_URL = settings.database_url

print(f"Intentando conectar a: {DATABASE_URL}")  # Debug (quita esto en producción)

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

# Set the default schema for the models
Base.metadata.schema = "animals"

# Dependency para obtener la sesión de la base de datos
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

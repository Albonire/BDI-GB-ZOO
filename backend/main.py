from fastapi import FastAPI, Depends
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy import create_engine, text
from src.app.database.database import get_db, Base
from src.app.routers import animales, cuidadores, especies, habitats
from src.app.config import settings

# Importar todos los modelos para que SQLAlchemy los registre
from src.app.models import (
    AnimalesModel, CuidadorModel, EspecieModel, HabitatModel,
    FamiliaModel, EstadoConservacionModel, EspecialidadModel,
    UbicacionModel, ClimaModel
)

app = FastAPI(title="Zoo API", version="1.0.0")

# Configurar CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["https://bdi-gb-zoo.vercel.app", "http://localhost:3000", "http://localhost:5000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Incluir routers
app.include_router(animales.router, prefix="/animales", tags=["animales"])
app.include_router(cuidadores.router, prefix="/cuidadores", tags=["cuidadores"])
app.include_router(especies.router, prefix="/especies", tags=["especies"])
app.include_router(habitats.router, prefix="/habitats", tags=["habitats"])

@app.get("/")
def read_root():
    return {"message": "Zoo API is running!"}

@app.post("/init-db")
def init_database():
    """Endpoint para inicializar la base de datos"""
    try:
        # Crear el motor de la base de datos
        engine = create_engine(settings.database_url)
        
        # Crear una conexión
        with engine.connect() as connection:
            # Crear el esquema 'animals' si no existe
            connection.execute(text("CREATE SCHEMA IF NOT EXISTS animals"))
            connection.commit()
            
            # Crear todas las tablas
            Base.metadata.create_all(bind=engine)
            
            # Verificar que las tablas se crearon
            result = connection.execute(text("""
                SELECT table_name 
                FROM information_schema.tables 
                WHERE table_schema = 'animals'
                ORDER BY table_name
            """))
            
            tables = [row[0] for row in result]
            
        return {
            "message": "Base de datos inicializada correctamente",
            "tables_created": tables
        }
        
    except Exception as e:
        return {
            "error": f"Error al inicializar la base de datos: {str(e)}"
        }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
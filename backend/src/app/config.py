from pydantic import BaseModel, ConfigDict
import os

class Settings(BaseModel):
    database_url: str
    secret_key: str

    model_config = ConfigDict(env_file=".env")  # Solo para desarrollo local

# Crear instancia de settings desde variables de entorno
settings = Settings(
    database_url=os.getenv("DATABASE_URL", ""),
    secret_key=os.getenv("SECRET_KEY", "")
) 
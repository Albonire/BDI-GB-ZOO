from pydantic import BaseSettings

class Settings(BaseSettings):
    database_url: str
    secret_key: str

    class Config:
        env_file = ".env"  # Solo para desarrollo local

settings = Settings() 
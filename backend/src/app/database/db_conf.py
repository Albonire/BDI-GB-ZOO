from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    db_host: str
    db_port: int
    db_name: str
    db_user: str
    db_password: str
    app_env: str = "development"
    secret_key: str = "albonire21"  # Valor por defecto

    class Config:
        env_file = ".env"

# Instancia global de configuración
settings = Settings()
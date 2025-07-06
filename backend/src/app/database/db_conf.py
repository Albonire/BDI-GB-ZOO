from dotenv import load_dotenv
import os

# Cargar variables de entorno desde el archivo .env
load_dotenv()

# Acceso a las variables de entorno
DB_HOST = os.getenv('DB_HOST')
DB_PORT = os.getenv('DB_PORT')
DB_NAME = os.getenv('DB_NAME')
DB_USER = os.getenv('DB_USER')
DB_PASSWORD = os.getenv('DB_PASSWORD')
APP_ENV = os.getenv('APP_ENV', 'development')
SECRET_KEY = os.getenv('SECRET_KEY', 'albonire21')

# Instancia global de configuración
settings = {
    'db_host': DB_HOST,
    'db_port': DB_PORT,
    'db_name': DB_NAME,
    'db_user': DB_USER,
    'db_password': DB_PASSWORD,
    'app_env': APP_ENV,
    'secret_key': SECRET_KEY
}
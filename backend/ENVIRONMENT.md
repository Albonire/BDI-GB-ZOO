# Variables de Entorno

## Variables necesarias para el despliegue en Render:

### DATABASE_URL
URL de conexión a la base de datos PostgreSQL
Ejemplo: `postgresql://username:password@host:port/database`

### SECRET_KEY
Clave secreta para la aplicación
Ejemplo: `your-secret-key-here`

### PYTHON_VERSION
Versión de Python a usar (opcional, ya especificado en runtime.txt)
Valor: `3.10.11`

## Configuración en Render Dashboard:

1. Ve a tu servicio en Render
2. Ve a la pestaña "Environment"
3. Agrega las variables:
   - Key: `DATABASE_URL`, Value: tu URL de PostgreSQL
   - Key: `SECRET_KEY`, Value: tu clave secreta
   - Key: `PYTHON_VERSION`, Value: `3.10.11` (opcional) 
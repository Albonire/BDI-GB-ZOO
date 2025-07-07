# Variables de Entorno

## Variables necesarias para el despliegue en Render:

### DATABASE_URL
URL de conexión a la base de datos PostgreSQL
Ejemplo: `postgresql://username:password@host:port/database`

### SECRET_KEY
Clave secreta para la aplicación
Ejemplo: `your-secret-key-here`

### PYTHON_VERSION
Versión de Python a usar (recomendado para estabilidad)
Valor: `3.11.4`

## Configuración en Render Dashboard:

1. Ve a tu servicio en Render
2. Ve a la pestaña "Environment"
3. Agrega las variables:
   - Key: `DATABASE_URL`, Value: tu URL de PostgreSQL
   - Key: `SECRET_KEY`, Value: tu clave secreta
   - Key: `PYTHON_VERSION`, Value: `3.11.4` (recomendado)

## Notas importantes:

- Python 3.11.4 es una versión estable y ampliamente soportada en Render
- Esta versión es compatible con todas las dependencias del proyecto
- Evita usar versiones muy específicas como 3.10.11 que pueden causar problemas 
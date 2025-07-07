# Configuración de la Base de Datos

## Problema Actual

El backend está funcionando correctamente en Render, pero las tablas de la base de datos no existen. Esto causa errores como:
- `relation "animals.cuidador" does not exist`
- `relation "animals.habitat" does not exist`
- etc.

## Solución

### Opción 1: Inicialización Automática (Recomendada)

El archivo `render.yaml` está configurado para ejecutar automáticamente el script de inicialización durante el build:

```yaml
buildCommand: |
  pip install -r requirements.txt
  python init_db.py
```

Esto debería crear automáticamente:
1. El esquema `animals`
2. Todas las tablas necesarias

### Opción 2: Inicialización Manual

Si la inicialización automática no funciona, puedes inicializar la base de datos manualmente:

#### Usando el endpoint de la API:
```bash
curl -X POST https://bdi-gb-zoo-backend.onrender.com/init-db
```

#### Usando el script local:
```bash
cd backend
python init_db.py
```

### Opción 3: Ejecutar desde Render Dashboard

1. Ve a tu servicio en Render Dashboard
2. Ve a la pestaña "Shell"
3. Ejecuta:
```bash
python init_db.py
```

## Verificación

Después de la inicialización, puedes verificar que las tablas se crearon correctamente visitando:
- `https://bdi-gb-zoo-backend.onrender.com/` - Debería mostrar "Zoo API is running!"
- `https://bdi-gb-zoo-backend.onrender.com/animales/` - Debería devolver una lista vacía en lugar de un error

## Estructura de la Base de Datos

El sistema creará las siguientes tablas en el esquema `animals`:
- `animales` - Información de los animales
- `cuidador` - Información de los cuidadores
- `especie` - Especies de animales
- `habitat` - Hábitats
- `familia` - Familias taxonómicas
- `estado_conservacion` - Estados de conservación
- `especialidad` - Especialidades de los cuidadores
- `ubicacion` - Ubicaciones
- `clima` - Tipos de clima

## Notas Importantes

- El esquema `animals` se creará automáticamente si no existe
- Las tablas se crearán con las relaciones correctas
- Los datos no se insertarán automáticamente, solo la estructura
- Para insertar datos de prueba, necesitarás crear endpoints adicionales o usar scripts SQL 
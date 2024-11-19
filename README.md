# Sistema de Gestión de Zoológico - Proyecto de Base de Datos
🚀 **Proyecto de Base de Datos I**

**Autor**: [Anderson González](https://github.com/Albonire)  
**Directorio Fuente**: `/src/Git/BDI-GB-ZOO` 📂  
**Creado**: 23-Octubre-2024 🗓️  
**Última Actualización**: 14-Noviembre-2024  

## Descripción
Este proyecto implementa un sistema de base de datos diseñado para gestionar las operaciones de un zoológico, desde la administración de hábitats y cuidadores hasta el seguimiento de visitantes y animales. Incluye scripts SQL, modelos de datos, y herramientas para automatización y pruebas. Ideal para aprender y aplicar conceptos de bases de datos relacionales.

Las contribuciones y los comentarios siempre son bienvenidos. 🙌

---

## Estructura del Proyecto
El proyecto está organizado en diferentes carpetas, cada una dedicada a un aspecto específico del desarrollo. A continuación, se detalla el contenido:

### 📚 [docs/](./docs/)
**Propósito**: Centraliza toda la documentación del proyecto.

**Contenido**:
- `Diccionario_Datos.xlsx`: Diccionario de datos detallado.
- `Requerimientos.md`: Documento para especificar requerimientos del sistema.
- `Especificaciones.md`: Explicación de especificaciones técnicas y lógicas.

### 🗺️ [models/](./models/)
**Propósito**: Almacena los modelos de base de datos en sus diferentes etapas.

1. [ERD/](./models/ERD/): Diagrama Entidad-Relación que representa el diseño inicial.
2. [LDM/](./models/LDM/): Modelos lógicos que definen relaciones y atributos sin detalles físicos.
3. [PDM/](./models/PDM/): Modelos físicos con definiciones concretas para la implementación.

### 🛠️ [scripts/](./scripts/)
**Propósito**: Contiene todos los scripts SQL y archivos de automatización.

1. [ddl/](./scripts/ddl/): Scripts de definición de estructura (ej., `CREATE TABLE`, `CREATE INDEX`).
2. [dml/](./scripts/dml/): Scripts para inserciones, actualizaciones y eliminaciones.
3. [select/](./scripts/select/): Consultas SQL para validación de datos o reportes.
4. [scripts_auto/](./scripts/scripts_auto/): Scripts de automatización para ejecutar tareas en batch.

### 🗄️ [data/](./data/)
**Propósito**: Almacena datos externos, procesados y respaldos.

1. [raw/](./data/raw/): Datos originales en bruto.
2. [processed/](./data/processed/): Datos limpios y listos para cargar.
3. [backups/](./data/backups/): Archivos de respaldo de la base de datos.

### 🧪 [tests/](./tests/)
**Propósito**: Scripts de pruebas para validar la base de datos.

1. [test_cases/](./tests/test_cases/): Casos de prueba específicos.
2. **Archivos de pruebas**:
   - `integrity_tests.sql`: Pruebas de integridad referencial.
   - `performance_tests.sql`: Pruebas de rendimiento.
   - `data_quality_tests.sql`: Validación de calidad de datos.

---

## Contribuciones
Las contribuciones son bienvenidas. Por favor, abre un *issue* o crea un *pull request* con tus sugerencias.

---


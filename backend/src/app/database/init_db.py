from src.app.database.database import SessionLocal
from src.app.models.especialidad import EspecialidadModel
from src.app.models.clima import ClimaModel
from src.app.models.ubicacion import UbicacionModel
from src.app.models.estado_conservacion import EstadoConservacionModel

def init_db():
    db = SessionLocal()
    try:
        # Crear especialidades
        especialidades = [
            EspecialidadModel(nombre="Mamíferos", descripcion="Especialista en mamíferos"),
            EspecialidadModel(nombre="Aves", descripcion="Especialista en aves"),
            EspecialidadModel(nombre="Reptiles", descripcion="Especialista en reptiles")
        ]
        db.add_all(especialidades)
        
        # Crear climas
        climas = [
            ClimaModel(nombre="Tropical", descripcion="Clima cálido y húmedo"),
            ClimaModel(nombre="Templado", descripcion="Clima moderado"),
            ClimaModel(nombre="Ártico", descripcion="Clima frío extremo")
        ]
        db.add_all(climas)
        
        # Crear ubicaciones
        ubicaciones = [
            UbicacionModel(nombre="Zona Norte", descripcion="Sector norte del zoológico"),
            UbicacionModel(nombre="Zona Sur", descripcion="Sector sur del zoológico"),
            UbicacionModel(nombre="Zona Central", descripcion="Área central del zoológico")
        ]
        db.add_all(ubicaciones)

        # Crear estados de conservación
        estados = [
            EstadoConservacionModel(nombre="En Peligro", descripcion="Especie en riesgo crítico"),
            EstadoConservacionModel(nombre="Vulnerable", descripcion="Especie amenazada"),
            EstadoConservacionModel(nombre="Estable", descripcion="Población estable")
        ]
        db.add_all(estados)
        
        db.commit()
        print("Datos iniciales creados exitosamente")
        
    except Exception as e:
        print(f"Error: {e}")
        db.rollback()
    finally:
        db.close()

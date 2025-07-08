import os
import sys
from sqlalchemy import text
from src.app.database.database import engine

def insert_sample_data():
    """Insertar datos de prueba en la base de datos"""
    
    # Datos de familias
    familias_data = [
        ('Felidae', 'Felinos'),
        ('Canidae', 'Canidos'),
        ('Ursidae', 'Ursidos'),
        ('Cercopithecidae', 'Monos del viejo mundo'),
        ('Hominidae', 'Grandes simios'),
        ('Elephantidae', 'Elefantes'),
        ('Psittacidae', 'Loros'),
        ('Testudinidae', 'Tortugas terrestres'),
        ('Crocodylidae', 'Cocodrilos'),
        ('Delphinidae', 'Delfín'),
        ('Balaenopteridae', 'Ballena'),
        ('Phocidae', 'Foca'),
        ('Formicidae', 'Hormigas'),
        ('Coleoptera', 'Escarabajos'),
        ('Apidae', 'Abejorros'),
        ('Nymphalidae', 'Mariposas'),
        ('Lampyridae', 'Luciernagas'),
        ('Vespidae', 'Avispas'),
        ('Gryllidae', 'Grillos'),
        ('Vespertilionidae', 'Murciélagos'),
        ('Strigidae', 'Lechuzas'),
        ('Pteropodidae', 'Zorros voladores')
    ]
    
    # Datos de estado de conservación
    estados_data = [
        (1, 'Extinto', 'La especie ya no existe'),
        (2, 'Extinto en estado salvaje', 'Solo sobrevive en cautiverio'),
        (3, 'En peligro critico', 'En peligro extremo de extinción'),
        (4, 'En peligro', 'Alto riesgo de extincion'),
        (5, 'Vulnerable', 'Riesgo elevado de extincion a mediano plazo'),
        (6, 'Casi amenazado', 'En riesgo, pero no aun en peligro'),
        (7, 'Preocupacion menor', 'Bajo riesgo de extincion'),
        (8, 'Datos deficientes', 'No hay informacion suficiente'),
        (9, 'No evaluado', 'Aun no se ha evaluado el estado de conservacion')
    ]
    
    # Datos de ubicaciones
    ubicaciones_data = [
        'Zona Tropical',
        'Zona Desertica',
        'Zona de Montaña',
        'Aviario',
        'Acuario',
        'Zona de Reptiles',
        'Sabana Africana',
        'Bosque Lluvioso',
        'Zona de Mamiferos',
        'Area de Exhibicion',
        'Centro de Conservacion',
        'Zona de Aves',
        'Pradera',
        'Habitat Artico',
        'Habitat Nocturno',
        'Zona de Insectos',
        'Jardin Botanico',
        'Playa Artificial',
        'Recinto de Grandes Felinos',
        'Zona de Alimentacion'
    ]
    
    # Datos de climas
    climas_data = [
        'Tropical',
        'Desertico',
        'Templado',
        'Mediterraneo',
        'Polar',
        'Continental',
        'Subtropical',
        'Monzonico',
        'Arido',
        'Humedo',
        'Nuboso',
        'Lluvioso',
        'Seco',
        'Marino',
        'Alpino'
    ]
    
    # Datos de especialidades
    especialidades_data = [
        'Manejo de Grandes Felinos',
        'Cuidados de Reptiles',
        'Aves Exoticas',
        'Mamiferos Marinos',
        'Primates',
        'Animales de Clima Frio',
        'Animales en Peligro de Extincion',
        'Animales Nocturnos',
        'Grandes Herbivoros',
        'Manejo de Veneno y Antidotos',
        'Cuidados de Insectos',
        'Animales del Desierto',
        'Acuario',
        'Animales Domesticos',
        'Cria en Cautiverio'
    ]
    
    # Datos de cuidadores
    cuidadores_data = [
        'Juan Pérez',
        'María López',
        'Carlos Gómez',
        'Ana Rivas',
        'Pedro Sánchez',
        'Laura Torres',
        'Miguel Díaz',
        'Lucía Ortega',
        'Roberto Castro',
        'Carmen Suárez',
        'Elena Martínez',
        'Tomás Romero',
        'Daniela Méndez',
        'Javier Ruiz',
        'Sofía Morales',
        'Luis Fernández',
        'Patricia Navarro',
        'Francisco Herrera',
        'Clara Jiménez',
        'José García'
    ]
    
    # Datos de especies
    especies_data = [
        ('León', 'Gran felino de la familia Felidae'),
        ('Tigre', 'Gran felino de la familia Felidae'),
        ('Jaguar', 'Gran felino de la familia Felidae'),
        ('Leopardo', 'Gran felino de la familia Felidae'),
        ('Pantera', 'Gran felino de la familia Felidae'),
        ('Guepardo', 'Gran felino de la familia Felidae'),
        ('Lobo', 'Canido salvaje de la familia Canidae'),
        ('Coyote', 'Canido salvaje de la familia Canidae'),
        ('Zorro Rojo', 'Canido salvaje de la familia Canidae'),
        ('Oso Pardo', 'Gran oso de la familia Ursidae'),
        ('Oso Polar', 'Gran oso de la familia Ursidae'),
        ('Panda Gigante', 'Gran oso de la familia Ursidae'),
        ('Gorila de Montaña', 'Gran simio de la familia Hominidae'),
        ('Chimpancé', 'Gran simio de la familia Hominidae'),
        ('Elefante Africano', 'Gran mamifero de la familia Elephantidae'),
        ('Guacamayo Rojo', 'Ave de la familia Psittacidae'),
        ('Loro Amazónico', 'Ave de la familia Psittacidae'),
        ('Tortuga Gigante de Galápagos', 'Reptil de la familia Testudinidae'),
        ('Delfín', 'Mamifero marino de la familia Delphinidae'),
        ('Ballena', 'Mamifero marino de la familia Balaenopteridae')
    ]
    
    # Datos de hábitats
    habitats_data = [
        ('Selva densa tropical', 'Selva tropical con vegetación densa y clima húmedo'),
        ('Llanura africana', 'Sabana africana con pastizales y árboles dispersos'),
        ('Desierto arenoso', 'Desierto con dunas de arena y clima extremadamente seco'),
        ('Pico nevado', 'Montaña con nieve permanente y clima alpino'),
        ('Reef coralino', 'Arrecife de coral con vida marina diversa'),
        ('Santuario de aves tropicales', 'Hábitat para aves tropicales coloridas'),
        ('Tundra ártica', 'Tundra ártica con clima polar extremo'),
        ('Territorio felino', 'Hábitat especializado para grandes felinos'),
        ('Vivero tropical', 'Vivero con plantas tropicales'),
        ('Costa rocosa', 'Costa con rocas y clima marino')
    ]
    
    # Datos de animales de ejemplo
    animales_data = [
        ('Simba', '2020-03-15', 1, 1, 1),  # León
        ('Rajah', '2019-07-22', 1, 1, 2),  # Tigre
        ('Shadow', '2021-01-10', 2, 3, 3), # Jaguar
        ('Baloo', '2018-11-05', 10, 4, 10), # Oso Pardo
        ('Koda', '2020-12-20', 6, 7, 11),  # Oso Polar
        ('Bamboo', '2019-05-12', 15, 8, 12), # Panda
        ('Koko', '2017-09-30', 5, 9, 13),  # Gorila
        ('Caesar', '2020-02-14', 5, 9, 14), # Chimpancé
        ('Dumbo', '2016-06-18', 9, 2, 15), # Elefante
        ('Rio', '2021-04-25', 3, 6, 16),   # Guacamayo
        ('Echo', '2020-08-08', 3, 6, 17),  # Loro
        ('Shelly', '2015-12-03', 1, 5, 18), # Tortuga
        ('Flipper', '2019-10-11', 4, 5, 19), # Delfín
        ('Moby', '2014-03-28', 4, 5, 20)   # Ballena
    ]
    
    try:
        with engine.connect() as conn:
            # Insertar familias
            print("Insertando familias...")
            for nombre_cientifico, nombre_comun in familias_data:
                conn.execute(text("""
                    INSERT INTO animals.familia (nombrecientifico, nombrecomun) 
                    VALUES (:nombre_cientifico, :nombre_comun)
                    ON CONFLICT (nombrecientifico) DO NOTHING
                """), {"nombre_cientifico": nombre_cientifico, "nombre_comun": nombre_comun})
            
            # Insertar estados de conservación
            print("Insertando estados de conservación...")
            for codigo, nombre, descripcion in estados_data:
                conn.execute(text("""
                    INSERT INTO animals.estado_conservacion (id, nombre, descripcion) 
                    VALUES (:codigo, :nombre, :descripcion)
                    ON CONFLICT (id) DO NOTHING
                """), {"codigo": codigo, "nombre": nombre, "descripcion": descripcion})
            
            # Insertar ubicaciones
            print("Insertando ubicaciones...")
            for nombre in ubicaciones_data:
                conn.execute(text("""
                    INSERT INTO animals.ubicacion (nombre) 
                    VALUES (:nombre)
                    ON CONFLICT (nombre) DO NOTHING
                """), {"nombre": nombre})
            
            # Insertar climas
            print("Insertando climas...")
            for nombre in climas_data:
                conn.execute(text("""
                    INSERT INTO animals.clima (nombre) 
                    VALUES (:nombre)
                    ON CONFLICT (nombre) DO NOTHING
                """), {"nombre": nombre})
            
            # Insertar especialidades
            print("Insertando especialidades...")
            for nombre in especialidades_data:
                conn.execute(text("""
                    INSERT INTO animals.especialidad (nombre) 
                    VALUES (:nombre)
                    ON CONFLICT (nombre) DO NOTHING
                """), {"nombre": nombre})
            
            # Insertar cuidadores
            print("Insertando cuidadores...")
            for i, nombre in enumerate(cuidadores_data):
                especialidad_id = (i % len(especialidades_data)) + 1
                conn.execute(text("""
                    INSERT INTO animals.cuidador (nombre, especialidad_id) 
                    VALUES (:nombre, :especialidad_id)
                    ON CONFLICT (nombre) DO NOTHING
                """), {"nombre": nombre, "especialidad_id": especialidad_id})
            
            # Insertar especies
            print("Insertando especies...")
            for nombre, descripcion in especies_data:
                # Asignar estado de conservación aleatorio entre 4-7 (en peligro a preocupación menor)
                estado_id = 5  # Vulnerable por defecto
                conn.execute(text("""
                    INSERT INTO animals.especie (nombre, descripcion, estado_conservacion_id) 
                    VALUES (:nombre, :descripcion, :estado_id)
                    ON CONFLICT (nombre) DO NOTHING
                """), {"nombre": nombre, "descripcion": descripcion, "estado_id": estado_id})
            
            # Insertar hábitats
            print("Insertando hábitats...")
            for nombre, descripcion in habitats_data:
                # Asignar ubicación y clima aleatorios
                ubicacion_id = 1  # Zona Tropical por defecto
                clima_id = 1      # Tropical por defecto
                conn.execute(text("""
                    INSERT INTO animals.habitat (nombre, descripcion, ubicacion_id, clima_id) 
                    VALUES (:nombre, :descripcion, :ubicacion_id, :clima_id)
                    ON CONFLICT (nombre) DO NOTHING
                """), {"nombre": nombre, "descripcion": descripcion, "ubicacion_id": ubicacion_id, "clima_id": clima_id})
            
            # Insertar animales
            print("Insertando animales...")
            for nombre, fecha_nacimiento, cuidador_id, habitat_id, especie_id in animales_data:
                conn.execute(text("""
                    INSERT INTO animals.animales (nombre, fecha_nacimiento, cuidador_id, habitat_id, especie_id) 
                    VALUES (:nombre, :fecha_nacimiento, :cuidador_id, :habitat_id, :especie_id)
                    ON CONFLICT (nombre) DO NOTHING
                """), {
                    "nombre": nombre, 
                    "fecha_nacimiento": fecha_nacimiento, 
                    "cuidador_id": cuidador_id, 
                    "habitat_id": habitat_id, 
                    "especie_id": especie_id
                })
            
            conn.commit()
            print("✅ Datos de prueba insertados correctamente")
            
    except Exception as e:
        print(f"❌ Error al insertar datos de prueba: {e}")
        raise

if __name__ == "__main__":
    insert_sample_data() 
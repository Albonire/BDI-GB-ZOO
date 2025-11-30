from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from src.app.database.database import Base
from src.app.models.clima import ClimaModel
from src.app.models.ubicacion import UbicacionModel
from src.app.models.especie import EspecieModel

class HabitatModel(Base):
    __tablename__ = "habitat"
    # __table_args__ = {"schema": "animals"}  # Comentado para SQLite

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String(50), nullable=False)
    descripcion = Column(String(200))
    clima_id = Column(Integer, ForeignKey('clima.id'))
    ubicacion_id = Column(Integer, ForeignKey('ubicacion.id'))
    
    # Definir las relaciones usando el nombre correcto de la clase
    clima = relationship("ClimaModel", back_populates="habitats")
    ubicacion = relationship("UbicacionModel", back_populates="habitats")
    animales = relationship("AnimalesModel", back_populates="habitat")
    especies = relationship("EspecieModel", back_populates="habitat")

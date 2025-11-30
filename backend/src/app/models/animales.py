from sqlalchemy import Column, Integer, String, Date, ForeignKey
from sqlalchemy.orm import relationship
from src.app.database.database import Base

class AnimalesModel(Base):
    __tablename__ = "animales"
    # __table_args__ = {"schema": "animals"}  # Comentado para SQLite

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String(50), nullable=False)
    fecha_nacimiento = Column(Date, nullable=True)
    cuidador_id = Column(Integer, ForeignKey('cuidador.id'))
    habitat_id = Column(Integer, ForeignKey('habitat.id'))
    especie_id = Column(Integer, ForeignKey('especie.id'))
    
    # Definir las relaciones
    cuidador = relationship("CuidadorModel", back_populates="animales")
    habitat = relationship("HabitatModel", back_populates="animales")
    especie = relationship("EspecieModel", back_populates="animales")

# app/models/cuidador.py
from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from src.app.database.database import Base
from src.app.models.animales import AnimalesModel
from src.app.models.especialidad import EspecialidadModel

class CuidadorModel(Base):
    __tablename__ = "cuidador"
    __table_args__ = {"schema": "animals"}
    
    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String(50), nullable=False)
    especialidad_id = Column(Integer, ForeignKey('animals.especialidad.id'))
    
    # Definir las relaciones
    especialidad = relationship("EspecialidadModel", back_populates="cuidadores")
    animales = relationship("AnimalesModel", back_populates="cuidador")
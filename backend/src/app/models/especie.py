from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from src.app.database.database import Base

class EspecieModel(Base):
    __tablename__ = "especie"
    __table_args__ = {"schema": "animals"}

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String(50), nullable=False)
    descripcion = Column(String(200))
    habitat_id = Column(Integer, ForeignKey('animals.habitat.id'))
    estado_conservacion_id = Column(Integer, ForeignKey('animals.estado_conservacion.id'))

    # Relaciones
    habitat = relationship("HabitatModel", back_populates="especies")
    estado_conservacion = relationship("EstadoConservacionModel", back_populates="especies")
    animales = relationship("AnimalesModel", back_populates="especie")
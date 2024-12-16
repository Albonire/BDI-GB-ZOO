from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from src.app.database.database import Base

class EspecialidadModel(Base):
    __tablename__ = "especialidad"
    __table_args__ = {"schema": "animals"}

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String(50), nullable=False)
    descripcion = Column(String(200))

    # Agregar la relación inversa con cuidadores
    cuidadores = relationship("CuidadorModel", back_populates="especialidad")

from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from src.app.database.database import Base

class ClimaModel(Base):
    __tablename__ = "clima"
    __table_args__ = {"schema": "animals"}

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String(50), nullable=False)
    descripcion = Column(String(200))

    # Agregar la relación inversa
    habitats = relationship("HabitatModel", back_populates="clima")

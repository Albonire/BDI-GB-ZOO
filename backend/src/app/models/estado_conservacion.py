# src/app/models/estado_conservacion.py
from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from src.app.database.database import Base

class EstadoConservacionModel(Base):
    __tablename__ = "estado_conservacion"
    __table_args__ = {"schema": "animals"}

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String(50), nullable=False)
    descripcion = Column(String(200))
    
    # Relación con especies
    especies = relationship("EspecieModel", back_populates="estado_conservacion")
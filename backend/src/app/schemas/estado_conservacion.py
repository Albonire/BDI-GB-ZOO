from pydantic import BaseModel
from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from src.app.database.database import Base

class EstadoConservacionBase(BaseModel):
    codigo: str
    nombre: str
    descripcion: str

class EstadoConservacionCreate(EstadoConservacionBase):
    pass

class EstadoConservacion(EstadoConservacionBase):
    id: int

    class Config:
        from_attributes = True
        populate_by_name = True

class EstadoConservacionModel(Base):
    __tablename__ = "estado_conservacion"
    __table_args__ = {"schema": "animals"}

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String(50))
    descripcion = Column(String(200))

    # Relación con especies
    especies = relationship("EspecieModel", back_populates="estado_conservacion")

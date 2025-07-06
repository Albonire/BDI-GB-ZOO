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

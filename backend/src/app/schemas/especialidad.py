from sqlalchemy import Column, Integer, String
from src.app.database.database import Base

from pydantic import BaseModel

class EspecialidadBase(BaseModel):
    nombre: str
    descripcion: str | None = None

class EspecialidadCreate(EspecialidadBase):
    pass

class EspecialidadUpdate(EspecialidadBase):
    pass

class Especialidad(EspecialidadBase):
    id: int

    class Config:
        from_attributes = True

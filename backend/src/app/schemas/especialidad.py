from sqlalchemy import Column, Integer, String
from src.app.database.database import Base

from pydantic import BaseModel, ConfigDict

class EspecialidadBase(BaseModel):
    nombre: str
    descripcion: str | None = None

class EspecialidadCreate(EspecialidadBase):
    pass

class EspecialidadUpdate(EspecialidadBase):
    pass

class Especialidad(EspecialidadBase):
    id: int

    model_config = ConfigDict(from_attributes=True)

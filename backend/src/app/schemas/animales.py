# app/schemas/animales.py
from pydantic import BaseModel
from datetime import date
from typing import Optional

class AnimalesBase(BaseModel):
    nombre: str
    fecha_nacimiento: Optional[date] = None

class AnimalesCreate(AnimalesBase):
    cuidador_id: Optional[int] = None
    habitat_id: Optional[int] = None
    especie_id: Optional[int] = None

class AnimalesGetEndpoint(AnimalesBase):
    id: int
    cuidador_id: Optional[int] = None
    habitat_id: Optional[int] = None
    especie_id: Optional[int] = None

    class Config:
        from_attributes = True



    
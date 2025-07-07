# app/schemas/animales.py
from pydantic import BaseModel, ConfigDict
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

    model_config = ConfigDict(from_attributes=True)

class AnimalesPaginatedResponse(BaseModel):
    items: list[AnimalesGetEndpoint]
    total: int
    page: int
    page_size: int



    
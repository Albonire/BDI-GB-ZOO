from pydantic import BaseModel, Field, ConfigDict
from datetime import date
from decimal import Decimal
from typing import Optional
from src.app.schemas.especialidad import Especialidad

class CuidadorBase(BaseModel):
    nombre: str | None
    fechacontratacion: date | None
    salario: Decimal | None
    idespecialidad: int | None

class CuidadorCreate(CuidadorBase):
    pass

class CuidadorUpdate(BaseModel):
    nombre: str | None = None
    fechacontratacion: date | None = None
    salario: Decimal | None = None
    idespecialidad: int | None = None

class CuidadorSchema(CuidadorBase):
    id: int

    model_config = ConfigDict(from_attributes=True)

class CuidadorAnimal(BaseModel):
    id: int
    nombre: str | None
    especialidad: Especialidad

    model_config = ConfigDict(from_attributes=True, populate_by_name=True)

class CuidadorDropDown(BaseModel):
    id: int
    nombre: str | None
    
    model_config = ConfigDict(from_attributes=True)

from pydantic import BaseModel, ConfigDict
from typing import Optional
from src.app.schemas.familia import Familia
from src.app.schemas.estado_conservacion import EstadoConservacion

class EspecieBase(BaseModel):
    nombre: str
    idfamilia: int
    idestadoconservacion: int

class EspecieCreate(EspecieBase):
    pass

class Especie(EspecieBase):
    id: int

class EspecieAnimal(BaseModel):
    id: int
    nombre: str
    familia: Optional[Familia]
    estado_conservacion: Optional[EstadoConservacion]

    model_config = ConfigDict(from_attributes=True, populate_by_name=True)

class EspecieDropDown(BaseModel):
    id: int
    nombre: str
    
    model_config = ConfigDict(from_attributes=True)

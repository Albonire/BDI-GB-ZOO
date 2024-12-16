from pydantic import BaseModel
from typing import Optional
from src.app.schemas.ubicacion import Ubicacion
from src.app.schemas.clima import Clima

class HabitatBase(BaseModel):
    nombre: str
    tipo: Optional[str] = None
    capacidad: Optional[int] = None
    temperatura: Optional[float] = None
    humedad: Optional[float] = None

class HabitatCreate(HabitatBase):
    pass

class HabitatUpdate(HabitatBase):
    nombre: Optional[str] = None
    tipo: Optional[str] = None
    capacidad: Optional[int] = None
    temperatura: Optional[float] = None
    humedad: Optional[float] = None

class Habitat(HabitatBase):
    id: int

    class Config:
        from_attributes = True

class HabitatAnimal(BaseModel):
    id: int
    nombre: str
    ubicacion: Optional[Ubicacion]
    clima: Optional[Clima]

    class Config:
        from_attributes = True
        populate_by_name = True

class HabitatDropDown(BaseModel):
    id: int
    nombre: str
    
    class Config:
        from_attributes = True

        

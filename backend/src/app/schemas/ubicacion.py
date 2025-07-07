from pydantic import BaseModel, ConfigDict

class UbicacionBase(BaseModel):
    nombre: str

class UbicacionCreate(UbicacionBase):
    pass

class Ubicacion(UbicacionBase):
    id: int

    model_config = ConfigDict(from_attributes=True, populate_by_name=True)

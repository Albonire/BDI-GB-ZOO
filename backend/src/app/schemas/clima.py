from pydantic import BaseModel, ConfigDict

class ClimaBase(BaseModel):
    nombre: str

class ClimaCreate(ClimaBase):
    pass

class Clima(ClimaBase):
    id: int

    model_config = ConfigDict(from_attributes=True, populate_by_name=True)

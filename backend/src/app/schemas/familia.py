from pydantic import BaseModel, ConfigDict

class FamiliaBase(BaseModel):
    nombrecientifico: str
    nombrecomun: str

class FamiliaCreate(FamiliaBase):
    pass

class Familia(FamiliaBase):
    id: int

    model_config = ConfigDict(from_attributes=True, populate_by_name=True)

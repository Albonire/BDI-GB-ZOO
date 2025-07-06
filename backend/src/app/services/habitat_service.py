# app/services/habitat_service.py
from sqlalchemy.orm import Session
from fastapi import HTTPException
from src.app.models.habitat import HabitatModel
from src.app.schemas.habitat import HabitatCreate, HabitatUpdate
from typing import Dict, Any

def get_habitats(db: Session) -> Dict[str, Any]:
    habitats = db.query(HabitatModel).all()
    return {
        "items": [
            {
                "id": habitat.id,
                "nombre": habitat.nombre,
                "descripcion": habitat.descripcion,
                "clima_id": habitat.clima_id,
                "ubicacion_id": habitat.ubicacion_id
            }
            for habitat in habitats
        ],
        "total": len(habitats),
        "page": 1,
        "page_size": len(habitats)
    }

def get_habitat_by_id(db: Session, habitat_id: int):
    habitat = db.query(HabitatModel).filter(HabitatModel.id == habitat_id).first()
    if not habitat:
        raise HTTPException(status_code=404, detail="Habitat no encontrado")
    return habitat

def create_habitat(db: Session, habitat: HabitatCreate):
    db_habitat = HabitatModel(**habitat.dict())
    db.add(db_habitat)
    db.commit()
    db.refresh(db_habitat)
    return db_habitat

def update_habitat(db: Session, habitat_id: int, habitat: HabitatUpdate):
    db_habitat = get_habitat_by_id(db, habitat_id)
    
    for key, value in habitat.dict(exclude_unset=True).items():
        setattr(db_habitat, key, value)
    
    db.commit()
    db.refresh(db_habitat)
    return db_habitat

def delete_habitat(db: Session, habitat_id: int):
    habitat = get_habitat_by_id(db, habitat_id)
    db.delete(habitat)
    db.commit()
    return {"message": "Habitat eliminado exitosamente"}
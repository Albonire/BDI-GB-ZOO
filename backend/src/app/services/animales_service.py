# app/services/animales_service.py
from src.app.models.animales import AnimalesModel
from src.app.schemas.animales import AnimalesCreate, AnimalesGetEndpoint
from sqlalchemy.orm import Session
from typing import List
from src.app.models.cuidador import CuidadorModel
from src.app.models.especie import EspecieModel
from src.app.models.habitat import HabitatModel
from fastapi import HTTPException
from sqlalchemy import Column, Integer, String, Date, Numeric, ForeignKey
from sqlalchemy.orm import relationship
from src.app.database.database import Base


def create_animal(db: Session, animal: AnimalesCreate):
    db_animal = AnimalesModel(**animal.dict())
    db.add(db_animal)
    db.commit()
    db.refresh(db_animal)
    return db_animal

def get_animal_by_id(db: Session, animal_id: int):
    return db.query(AnimalesModel).filter(AnimalesModel.id == animal_id).first()

def get_animales_paginated(db: Session, page: int, page_size: int) -> List[AnimalesModel]:
    """
    Obtiene lista de animales con paginación.
    """
    skip = (page - 1) * page_size
    return (
        db.query(AnimalesModel)
        .order_by(AnimalesModel.id.desc())
        .offset(skip)
        .limit(page_size)
        .all()
    )

def delete_animal(db: Session, animal_id: int) -> bool:
    db_animal = get_animal_by_id(db, animal_id)
    if not db_animal:
        return False
    db.delete(db_animal)
    db.commit()
    return True
# app/services/cuidador_service.py
from sqlalchemy.orm import Session
from src.app.models.especialidad import EspecialidadModel
from src.app.models.cuidador import CuidadorModel
from src.app.schemas.cuidador import CuidadorCreate, CuidadorUpdate
from fastapi import HTTPException
from typing import Dict, Any

def get_cuidador_by_id(db: Session, cuidador_id: int):
    return db.query(CuidadorModel).filter(CuidadorModel.id == cuidador_id).first()

def create_cuidador(db: Session, cuidador: CuidadorCreate):
    db_cuidador = CuidadorModel(**cuidador.dict())
    db.add(db_cuidador)
    db.commit()
    db.refresh(db_cuidador)
    return db_cuidador

def update_cuidador(db: Session, cuidador_id: int, cuidador: CuidadorUpdate):
    db_cuidador = get_cuidador_by_id(db, cuidador_id)
    if not db_cuidador:
        return None
    
    for key, value in cuidador.dict(exclude_unset=True).items():
        setattr(db_cuidador, key, value)
    
    db.commit()
    db.refresh(db_cuidador)
    return db_cuidador

def delete_cuidador(db: Session, cuidador_id: int):
    db_cuidador = get_cuidador_by_id(db, cuidador_id)
    if not db_cuidador:
        return False
    
    db.delete(db_cuidador)
    db.commit()
    return True

def get_cuidadores(db: Session) -> Dict[str, Any]:
    """
    Obtiene todos los cuidadores.
    """
    cuidadores = db.query(CuidadorModel).all()
    return {
        "items": [
            {
                "id": cuidador.id,
                "nombre": cuidador.nombre,
                "especialidad_id": cuidador.especialidad_id
            }
            for cuidador in cuidadores
        ],
        "total": len(cuidadores),
        "page": 1,
        "page_size": len(cuidadores)
    }

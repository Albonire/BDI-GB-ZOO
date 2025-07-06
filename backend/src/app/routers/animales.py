from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from src.app.schemas.animales import AnimalesCreate, AnimalesGetEndpoint, AnimalesPaginatedResponse
from src.app.services.animales_service import create_animal, get_animales_paginated, delete_animal
from src.app.database.database import get_db
from typing import List

router = APIRouter(
    tags=["animales"]
)

@router.post("/", response_model=AnimalesGetEndpoint)
def registrar_animal(animal: AnimalesCreate, db: Session = Depends(get_db)):
    return create_animal(db, animal)

@router.get("/", response_model=AnimalesPaginatedResponse)
def listar_animales(page: int = 1, page_size: int = 10, db: Session = Depends(get_db)):
    return get_animales_paginated(db, page, page_size)

@router.delete("/{animal_id}", response_model=dict)
def eliminar_animal(animal_id: int, db: Session = Depends(get_db)):
    ok = delete_animal(db, animal_id)
    if not ok:
        raise HTTPException(status_code=404, detail="Animal no encontrado")
    return {"ok": True}

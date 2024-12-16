# app/services/especie_service.py
from sqlalchemy.orm import Session
from typing import List
from src.app.models.especie import Especie as EspecieModel
from src.app.schemas.especie import EspecieCreate

def get_especies(db: Session):
    """
    Obtiene todas las especies.
    """
    especies = db.query(EspecieModel).all()
    return especies
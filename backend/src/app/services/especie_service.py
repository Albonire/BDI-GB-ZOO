# app/services/especie_service.py
from sqlalchemy.orm import Session
from typing import List, Dict, Any
from src.app.models.especie import EspecieModel
from src.app.schemas.especie import EspecieCreate

def get_especies(db: Session) -> Dict[str, Any]:
    """
    Obtiene todas las especies.
    """
    especies = db.query(EspecieModel).all()
    return {
        "items": [
            {
                "id": especie.id,
                "nombre": especie.nombre,
                "descripcion": especie.descripcion,
                "habitat_id": especie.habitat_id,
                "estado_conservacion_id": especie.estado_conservacion_id
            }
            for especie in especies
        ],
        "total": len(especies),
        "page": 1,
        "page_size": len(especies)
    }
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from src.app.database.database import get_db
from src.app.services.especie_service import get_especies

router = APIRouter()

@router.get("/", response_model=dict)
def get_especies_endpoint(
    db: Session = Depends(get_db),
):
    """
    Endpoint para traer especies.
    """
    result = get_especies(db=db)
    return result

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from src.app.database.database import get_db
from src.app.models.animales import AnimalesModel

router = APIRouter()

@router.get("/animales/test")
async def test_animales():
    return {"message": "Ruta de animales funcionando"}

@router.get("/animales")
async def get_animales(db: Session = Depends(get_db)):
    try:
        print("Intentando obtener animales...")
        result = db.query(AnimalesModel).all()
        print(f"Resultados: {result}")
        return result
    except Exception as e:
        print(f"Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))

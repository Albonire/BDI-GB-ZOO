from sqlalchemy import Column, Integer, String
from src.app.database.database import Base

class FamiliaModel(Base):
    __tablename__ = "familia"
    __table_args__ = {"schema": "animals"}

    id = Column(Integer, primary_key=True, index=True)
    nombrecientifico = Column(String(50), nullable=False)
    nombrecomun = Column(String(50), nullable=False)
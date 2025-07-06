from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from src.app.routers import animales, cuidadores, habitats, especies

app = FastAPI()

# Configuración de CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:8080",
        "http://127.0.0.1:5500",
        "http://localhost:5500",
        "http://localhost",
        "http://127.0.0.1"
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(animales.router, prefix="/animales", tags=["animales"])
app.include_router(cuidadores.router, prefix="/cuidadores", tags=["cuidadores"])
app.include_router(habitats.router, prefix="/habitats", tags=["habitats"])
app.include_router(especies.router, prefix="/especies", tags=["especies"])

@app.get("/")
def read_root():
    return {"message": "PRUEBA RAIZ"}

@app.get("/dos")
def read_second():
    return {"message": "PRUEBA DOS"}

@app.get("/tres")
def read_third():
    return {"message": "PRUEBA TRES"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="127.0.0.1", port=8000, reload=True)
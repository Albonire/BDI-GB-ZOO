from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "PRUEBA RAIZ"}

@app.get("/dos")
def read_second():
    return {"message": "PRUEBA DOS"}

@app.get("/tres")
def read_third():
    return {"message": "PRUEBA TRES"}
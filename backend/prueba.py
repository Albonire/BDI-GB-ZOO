from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "PRUEBA ROOT"}

@app.get("/dos")
def read_second():
    return {"message": "PRUEBA DOS"} 
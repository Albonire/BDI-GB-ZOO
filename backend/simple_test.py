from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "RAIZ"}

@app.get("/dos")
def read_dos():
    return {"message": "DOS"}
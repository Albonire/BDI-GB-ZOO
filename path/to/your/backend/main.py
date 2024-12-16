from fastapi import FastAPI

app = FastAPI()

@app.get("/animales")
async def get_animales():
    # Logic to retrieve and return animal data
    return {"message": "List of animals"}
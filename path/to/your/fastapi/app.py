from fastapi import FastAPI

app = FastAPI()

@app.get("/animales")
async def get_animales():
    # Your logic to fetch and return animal data
    return {"data": "animal data"}from fastapi.middleware.cors import CORSMiddleware
    
    app.add_middleware(
        CORSMiddleware,
        allow_origins=["*"],  # Adjust this to your frontend's URL
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )
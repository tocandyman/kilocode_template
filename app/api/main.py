from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="Kilocode Template API", version="0.1.0")

class Health(BaseModel):
    status: str

@app.get("/health", response_model=Health)
def health() -> Health:
    return Health(status="ok")

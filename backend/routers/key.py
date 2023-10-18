from fastapi import APIRouter
from pydantic import BaseModel
import crypto

router = APIRouter(prefix="/key")


class Wather(BaseModel):
    encrypted_data: bytes


@router.get("/", description="Klucz publiczny do szyfrowania end-to-end")
def send_key():
    return {"public_key": crypto.public_key_send()}

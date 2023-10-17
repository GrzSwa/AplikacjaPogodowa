from fastapi import APIRouter
from pydantic import BaseModel
import search_data

router = APIRouter(prefix="/search")


class Search(BaseModel):
    search_name: str


@router.get("/", description="Wyświetlanie listy lokalizacji")
def send_search(data: Search):
    search_load = search_data.search(data.search_name)
    return search_load

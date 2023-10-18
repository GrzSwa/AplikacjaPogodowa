from fastapi import APIRouter
from pydantic import BaseModel
import astro_data

router = APIRouter(prefix="/unencrypted")


class Unencrypted(BaseModel):
    longitude: str
    latitude: str


@router.post("/weather", description="Dane pogodowe dla podanej lokalizacji")
def send_weather(data: Unencrypted):
    return astro_data.weather(data.longitude, data.latitude)


@router.post("/city", description="Informacje o mieście dla podanej lokalizacji")
def send_city(data: Unencrypted):
    return astro_data.get_city(data.longitude, data.latitude)

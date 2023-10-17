from fastapi import APIRouter
from pydantic import BaseModel
import crypto
import astro_data

router = APIRouter(prefix="/astro")


class Wather(BaseModel):
    encrypted_data: bytes


@router.get("/weather", description="Dane pogodowe dla podanej lokalizacji")
def send_weather(data: Wather):
    geo_data = crypto.decode_data(data.encrypted_data)
    return astro_data.weather(geo_data['longitude'], geo_data['latitude'])


@router.get("/city", description="Informacje o mieście dla podanej lokalizacji")
def send_city(data: Wather):
    geo_data = crypto.decode_data(data.encrypted_data)
    return astro_data.get_city(geo_data['longitude'], geo_data['latitude'])

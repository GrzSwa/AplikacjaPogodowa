import json

from fastapi import APIRouter
from pydantic import BaseModel
import crypto
import astro_data

router = APIRouter(prefix="/astro")


class Wather(BaseModel):
    encrypted_data: bytes


@router.post("/weather", description="Dane pogodowe dla podanej lokalizacji")
def send_weather(data: Wather):
    geo_data = crypto.decode_data(data.encrypted_data)
    jsonResponse = json.dumps(astro_data.weather(geo_data['longitude'], geo_data['latitude']), ensure_ascii=False).encode('utf-8')
    return jsonResponse


@router.post("/city", description="Informacje o mieście dla podanej lokalizacji")
def send_city(data: Wather):
    geo_data = crypto.decode_data(data.encrypted_data)
    return astro_data.get_city(geo_data['longitude'], geo_data['latitude'])

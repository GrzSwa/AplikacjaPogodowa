from fastapi import FastAPI
from pydantic import BaseModel
import crypto
import uvicorn

app = FastAPI()


class MyData(BaseModel):
    encrypted_data: bytes


@app.get("/weather")
def send_weather(data: MyData):
    geo_data = crypto.decode_data(data.encrypted_data)
    return crypto.weather(geo_data['longitude'], geo_data['latitude'])


@app.get("/city")
def send_city(data: MyData):
    geo_data = crypto.decode_data(data.encrypted_data)
    return crypto.get_city(geo_data['longitude'], geo_data['latitude'])


@app.get("/key")
def send_key():
    return {"public_key": str(crypto.public_key_send())}


if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=30000)
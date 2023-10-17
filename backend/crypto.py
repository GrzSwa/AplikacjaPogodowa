import json

from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import rsa, padding
from cryptography.hazmat.primitives import serialization, hashes
import base64




def key_generate():
    private_key = rsa.generate_private_key(public_exponent=65537, key_size=2048, backend=default_backend())
    public_key = private_key.public_key()
    private_key_pem = private_key.private_bytes(encoding=serialization.Encoding.PEM,
                                                format=serialization.PrivateFormat.PKCS8,
                                                encryption_algorithm=serialization.NoEncryption())
    with open("private_key.pem", "wb") as file:
        file.write(private_key_pem)

    public_key_pem = public_key.public_bytes(encoding=serialization.Encoding.PEM,
                                                format=serialization.PublicFormat.SubjectPublicKeyInfo)
    with open("public_key.pem", "wb") as file:
        file.write(public_key_pem)


def public_key_send():
    with open("public_key.pem", "rb") as file:
        public_key = serialization.load_pem_public_key(file.read(), backend=default_backend())
    public_key_pem = public_key.public_bytes(encoding=serialization.Encoding.PEM,
                                             format=serialization.PublicFormat.SubjectPublicKeyInfo)
    return public_key_pem


def decode_data(encrypted_message: bytes):
    with open("private_key.pem", "rb") as file:
        private_key = serialization.load_pem_private_key(file.read(), password=None, backend=default_backend())
    decode_message = base64.b64decode(encrypted_message)
    encrypted_message = private_key.decrypt(decode_message, padding.OAEP(mgf=padding.MGF1(algorithm=hashes.SHA256()),
                                                             algorithm=hashes.SHA256(), label=None))

    return json.loads(encrypted_message.decode("utf-8"))


def weather(lon: str, lat: str):
    import requests
    params = {
        "latitude": lat,
        "longitude": lon,
        "daily": "weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset,uv_index_max,precipitation_sum,windspeed_10m_max",
        "hourly": "temperature_2m,weathercode,windspeed_10m",
        "current": "temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,weathercode,surface_pressure,windspeed_10m,winddirection_10m",
        "timeformat": "iso8601",
        "timezone": "GMT"
    }
    url = "https://api.open-meteo.com/v1/forecast"

    data = requests.get(url, params=params).json()
    air_data = air_quality(lat, lon)
    city_name = json.loads(get_city(lat, lon))
    data['current']['european_aqi'] = air_data['current']['european_aqi']
    data['current']['city_name'] = city_name['display_name']
    del data['latitude']
    del data['longitude']
    return data


def air_quality(lon: str, lat: str):
    import requests
    params = {
        "latitude": lat,
        "longitude": lon,
        "current":"european_aqi",
        "forecast_days":"1",
        "timeformat":"iso8601",
        "timezone":"GMT"
      }
    url = "https://air-quality-api.open-meteo.com/v1/air-quality"

    data = requests.get(url, params=params).json()
    del data['latitude']
    del data['longitude']
    return data


def get_city(lon: str, lat: str):
    import requests
    params = {
        "lat": float(lat),
        "lon": float(lon),
        "format": "jsonv2",
        "accept-language": "pl-PL"
        }
    url = f"http://nominatim.openstreetmap.org/reverse"
    data = requests.get(url, params=params).text
    return data

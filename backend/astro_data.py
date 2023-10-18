import json
import requests
def weather(lon: str, lat: str):
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
    air_data = air_quality(lon, lat)
    city_name = get_city(lon,lat)
    data['current']['european_aqi'] = air_data['current']['european_aqi']
    data['current']['city_name'] = city_name['display_name']
    del data['latitude']
    del data['longitude']
    return data


def air_quality(lon: str, lat: str):
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
    params = {
        "lat": float(lat),
        "lon": float(lon),
        "format": "jsonv2",
        "accept-language": "pl-PL"
        }
    url = f"http://nominatim.openstreetmap.org/reverse"
    data = requests.get(url, params=params).json()
    return data

get_city("22","54")
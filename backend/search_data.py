from OSMPythonTools.nominatim import Nominatim
import re


def sign_escape(text):
    return re.sub(r'[^a-zA-Z0-9]', '', text)


def search(city_name: str):
    city_name = sign_escape(city_name)
    nominatim = Nominatim()
    city_data = nominatim.query(city_name).toJSON()
    print(city_name)
    return [location for location in city_data if location.get('addresstype') in
            ["city", "town", "village", "town", "region", "province"]]


print(search("Kielce"))

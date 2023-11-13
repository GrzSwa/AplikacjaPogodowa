from fastapi import FastAPI
import uvicorn
from routers import astro, key, search, unencrypted
import os

app = FastAPI(
title="Aplikacja pogodwa",
    description="Pobieranie danyc pogodowych z open-meteo.com",
    summary="",
    version="1.0.1",
    terms_of_service="https://example.com/",
    contact={
        "name": "Karol Wykrota, Grzegorz Swajda, Jakub Sadza",
        "url": "https://example.com/",
        "email": "",
    },
    license_info={
        "name": "Apache 2.0",
        "url": "https://www.apache.org/licenses/LICENSE-2.0.html",
    },
)

app.include_router(astro.router)
app.include_router(key.router)
app.include_router(search.router)
app.include_router(unencrypted.router)


if __name__ == "__main__":
    uvicorn.run(
        app,
        host="127.0.0.1",
        port=30000,
        ssl_certfile="cert.pem",
        ssl_keyfile="key.pem"
    )
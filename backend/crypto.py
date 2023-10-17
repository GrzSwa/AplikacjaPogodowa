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
    print(json.loads(encrypted_message.decode("utf-8")))
    return json.loads(encrypted_message.decode("utf-8"))

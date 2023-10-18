import 'package:encrypt/encrypt.dart' as crypto;
import 'package:pointycastle/asymmetric/api.dart';

crypto.Encrypted encryption(String publickKey, String plainText){
  
  final publicKey = crypto.RSAKeyParser().parse(publickKey) as RSAPublicKey;
  final encrypter = crypto.Encrypter(
                      crypto.RSA(
                        publicKey: publicKey,
                        encoding: crypto.RSAEncoding.OAEP,
                        digest: crypto.RSADigest.SHA256
                      )
                    );

  var encrypted = encrypter.encrypt(plainText);
  return encrypted;                  
}
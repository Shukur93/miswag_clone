// import 'package:encrypt/encrypt.dart';

// String decrypt(String keyString, Encrypted encryptedData, String iv) {
//   final key = Key.fromUtf8(keyString);
//   final ivBytes = IV.fromUtf8(iv);

//   final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
//   // final initVector = IV.fromUtf8(keyString.substring(0, 16));
//   return encrypter.decrypt(encryptedData, iv: ivBytes);
// }

// Encrypted encrypt(String keyString, String plainText, String iv) {
//   final key = Key.fromUtf8(keyString);
//   final ivBytes = IV.fromUtf8(iv);

//   final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

//   // final initVector = IV.fromUtf8(keyString.substring(0, 16));
//   Encrypted encryptedData = encrypter.encrypt(plainText, iv: ivBytes);
//   return encryptedData;
// }

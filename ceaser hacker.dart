import "ceaser cipher.dart";

void main() {
  int key = getCipherKey(msg: "Enter the Key used to encrypt > ");
  String secret = getSecret(msg: "Enter the secret > ");
  String message = decrypt(secret, key);
  print(message);
}

String decrypt(String secret, int key) {
  String decrypted = "";
  for (int i = 0; i < secret.length; i++) {
    int index = symbols.indexOf(secret[i].toUpperCase());
    int newIndex = index - key;
    if (newIndex < 0) {
      newIndex = maxSymbolLength + newIndex;
    }
    decrypted += symbols[newIndex];
  }
  return decrypted;
}

import "dart:math";

final symbols = "ABCDEFGHIJKLMNOPQRSTUVWXYZ .";
final message = "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG";

String getRandomMessage() {
  // we use a set to generate the key so we have unique elements in the key
  Set<String> key = {};
  Random rand = new Random();

  final length = symbols.length;

  // loop while the length of the key isn't the length of supported symbols
  while (key.length != length) {
    // randomly pick a letter from symbols and add to key
    key.add(symbols[rand.nextInt(length)]);
  }

  // convert key to a string
  final str = key.toList().join();
  return str;
}

Map<String, String> getRandomKey() {
  // we use a map to hold the mapping of each letter to a key
  Map<String, String> key = {};

  final length = symbols.length;

  String random = getRandomMessage();

  // generate the map for each symbol
  for (var i = 0; i < length; i++) {
    key[symbols[i]] = random[i];
  }

  // constants
  // key[" "] = " ";
  // key["."] = ".";

  return key;
}

String encrypt(String message, Map<String, String> key) {
  String encrypted = "";

  for (int i = 0; i < message.length; i++) {
    var m = key[message[i]];
    // for our program, m is never null
    encrypted += m!;
  }

  return encrypted;
}

String decrypt(String message, Map<String, String> key) {
  String decrypted = "";
  for (var i = 0; i < message.length; i++) {
    key.forEach((key, value) {
      value == message[i] ? decrypted += key : "";
    });
  }

  return decrypted;
}

void main() {
  print(
      "This is a cipher program that generates a secret message from a message");
  final key = getRandomKey();

  // uncomment this line of you want random messages
  // final message = getRandomMessage();
  
  final encrypted = encrypt(message, key);
  final decrypted = decrypt(encrypted, key);

  print("");

  print("Original message: $message");
  print("encrypted message: $encrypted");
  print("decrypted message: $decrypted");

  print("");
}

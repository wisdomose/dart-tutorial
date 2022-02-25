import "dart:io";

const String regex = r"[0-9][0-5]";
const String symbols =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890~!@#\$%^&*()~`';:\"\\/-+| ";
const int maxSymbolLength = symbols.length;

// returns the key to be used to cipher the message
int getCipherKey({String msg = ""}) {
  // runs as long as the input isn't an integer
  while (true) {
    stdout.write(
        "${msg.isNotEmpty ? msg : "Enter a key"} (0 - ${maxSymbolLength - 1}) > ");
    String? cipherKey = stdin.readLineSync();
    if (cipherKey != null) {
      try {
        // convert key to an integer
        int key = int.parse(cipherKey);
        if ((key.isEven || key.isOdd) && key <= maxSymbolLength - 1) {
          return key;
        }
      } on FormatException {}
    }
  }
}

// gets the string from the user
String getSecret({String msg = ""}) {
  while (true) {
    stdout.write("${msg.isNotEmpty ? msg : "Enter secret message > "}");
    String? secret = stdin.readLineSync();
    if (secret != null) return secret.toString().toUpperCase();
  }
}

String encrypt(String secret, int key) {
  String encrypted = "";
  for (int i = 0; i < secret.length; i++) {
    // get the position of the letter in symbols
    int index = symbols.indexOf(secret[i]);

    // if the letter is a special character or isn't in symbols
    if (index.isNegative) {
      encrypted += secret[i];
      continue;
    } else if (index == maxSymbolLength - 1) {
      // if the key is 1 the next symbol is B not A for the last element
      encrypted += symbols[key - 1];
    } else {
      int newSymbolIndex = index + key;
      if (newSymbolIndex > maxSymbolLength - 1) {
        newSymbolIndex = (newSymbolIndex % maxSymbolLength - 1) - 1;
      }
      encrypted += symbols[newSymbolIndex];
    }
  }
  return encrypted;
}

void main() {
  int key = getCipherKey();
  String secret = getSecret();
  String encrypted = encrypt(secret, key);
  print("\n\tencrypted text is: $encrypted\n");
}

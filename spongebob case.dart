import "dart:math";

bool isUppercase() {
  Random rand = Random();
  int ans = rand.nextInt(2);
  return ans == 0 ? false : true;
}

void main() {
  print(
      "spongebob case is a caing where words are mixed with uppercase and lowercase letters randomly");

  List<String> message =
      "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG".split("");

  for (var i = 0; i < message.length; i++) {
    bool isUpper = isUppercase();
    if (isUpper) {
      message[i] = message[i].toUpperCase();
    } else {
      message[i] = message[i].toLowerCase();
    }
  }

  print("");
  print("your spOngeBob case: \n\t${message.join()}");
  print("");
}

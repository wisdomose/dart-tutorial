import "dart:io";

void main() {
  print(
      "This is the 3n + 1 problem. it is the simplest impossible math problem");
  print("The three rules are considered");
  print("\t1.\t if n is even, the next number n is n / 2");
  print("\t3.\t if n is odd, the next number n is n * 3 + 1");
  print("\t3.\t if n is 1, stop else repeat");

  int n = 0;

  while (n <= 1) {
    stdout.write("Enter the value of n > ");
    String? input = stdin.readLineSync();
    if (input != null && input.contains(RegExp(r"^[0-9]+$"))) {
      n = int.parse(input);
    }
    if (n == 1) {
      print("n should be greater than 1");
    } else if (n == 0) {
      print("n should be greater than 0");
    }
  }

  print("n = $n");
  while (n != 1) {
    if (n.isEven) {
      n = (n / 2).floor();
    } else {
      n = n * 3 + 1;
    }
    print("n = $n");
  }
}

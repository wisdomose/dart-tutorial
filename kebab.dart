import 'dart:math';
import 'dart:io';

const int maxLength = 3;

String genRandomNumber() {
  Random rand = new Random();
  String output = "";
  for (int i = 0; i < maxLength; i++) {
    int num = rand.nextInt(10);
    // converts each number to a string
    output += num.toString();
  }
  return output;
}

String? getUserInput() {
  String? userInput = null;

  while (userInput == null || !userInput.contains(RegExp(r"^[0-9]{3}$"))) {
    stdout.write("> Enter a number: ");
    userInput = stdin.readLineSync();
  }

  return userInput;
}

// compares the random number and the user guess for the different conditions
String process(String random, String userInput) {
  List<String> result = [];
  for (int i = 0; i < maxLength; i++) {
    if (random[i] == userInput[i]) {
      // if a number is in its right pusition
      result.add("FOFO");
    } else if (random.contains(userInput[i])) {
      // if a number is not in its proper position but is in the correct position
      result.add("EBA");
    }
  }

  if (result.length == 0) {
    // if no number is in the random number
    return "KEBAB";
  } else {
    // shuffle the list so we don't give off the position of the number
    result.shuffle();
    // return the HINT
    return result.join(", ");
  }
}

void main() {
  // instructions
  print(
      "\nThe computer will pick a $maxLength digit number and you are to guess the number");
  print("The following HINTS will help in your journey\n");
  print(
      "FOFO: if a number in your guess is in its correct position in the random number");
  print(
      "EBA: if a number is in a wrong position in your guess but is in the random number");
  print("KEBAB: if no number in your guess is in the random number\n");

  // the random number by the computer
  final String randomNumber = genRandomNumber();

  while (true) {
    String? myGuess = getUserInput();

    if (myGuess == null) {
      return;
    }
    String processed = process(randomNumber, myGuess);
    print(processed);
    if (processed == "FOFO, FOFO, FOFO") break;
  }

  print("\n\tCongratulations. the random number was $randomNumber\n");
}

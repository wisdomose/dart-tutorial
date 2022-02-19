import "dart:io";
import "dart:math";

const int limit = 21;
const int maxtrials = 3;
const String regex = r"^0$|^1?[0-9]$|^20$";

bool validateGuess(var guess) {
  if (guess.contains(RegExp(regex))) {
    return true;
  } else {
    return false;
  }
}

String? getGuess(String msg) {
  stdout.write(msg);
  var myGuess = stdin.readLineSync();
  bool isValid = validateGuess(myGuess);

  // while the input isn't valid
  while (!isValid) {
    stdout.write("Please enter a valid guess: ");
    myGuess = stdin.readLineSync();
    isValid = validateGuess(myGuess);
  }

  return myGuess;
}

void main() {
  print("\nthis is a guess the number game\n");

  Random random = new Random();
  int guess = random.nextInt(limit); // the random number picked by the computer

  int trials = 0;
  bool guessedRight = false;

  print(
      "I just picked a number between 0 - ${limit - 1} can you guess it in $maxtrials trials?");

  String? myGuess; // the users guess

  // while you have not used up your trials and you haven't guessed right
  while (trials < maxtrials && !guessedRight) {
    if (trials > 0 && myGuess != null) {
      bool isGreater = int.parse(myGuess) > guess;
      print(
          "\t\tHINT: $myGuess is ${isGreater ? "greater" : "lesser"} than what i guessed");
    }
    myGuess = getGuess("\tTake a guess (${trials + 1} of $maxtrials): ");
    if (myGuess == guess.toString()) {
      guessedRight = true;
    }
    trials++;
  }

  if (guessedRight) {
    print("You guessed right in just $trials trial${trials == 1 ? "" : "s"}");
  } else {
    print("OOPS! you didn't get the right number. i guessed ${guess}");
  }
}

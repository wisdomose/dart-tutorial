import "dart:math";
import "dart:io";

final JAPANESE_NUMBERS = {
  1: 'ICHI',
  2: 'NI',
  3: 'SAN',
  4: 'SHI',
  5: 'GO',
  6: 'ROKU'
};

/// this is a game played in gambling houses
/// it consists of two six-sided dice rolled in a cup.
/// the gamblers must guess if the sum is even (CHO) or odd (HAN)

int rollDice() {
  int roll = 0;
  while (roll <= 0) {
    Random rand = new Random();
    roll = rand.nextInt(7);
  }
  return roll;
}

void main() async {
  int balance = 5000;
  int bid = 0;
  String? bet = "";
  bool quit = false;

  print("You have $balance in your purse");
  print(
      "Two dice are thrown and you are to bet if their sum is CHO (even) or HAN (odd)\n\n");
  while (!quit) {
    stdout.write(
        "You have $balance in your purse.\nHow much do you want to bet? > ");
    String? input = stdin.readLineSync();
    while (true) {
      try {
        if (input == null) {
          print("Enter a number");
        } else if (int.parse(input) < 0) {
          print("Enter a number greater than 0");
        } else if (int.parse(input) > balance) {
          print("you don not have enough money in your purse");
        } else {
          bid = int.parse(input);
          break;
        }
      } catch (e) {
        print("Enter a number");
      }
    }

// roll the dice
    int dice1 = rollDice();
    int dice2 = rollDice();

// get the users bet
    stdout.write("\nThe dealer rolls the dice. \nwhat is your bet? > ");
    while (true) {
      bet = stdin.readLineSync();
      if (bet == null) {
        stdout.write("Please enter a bet > ");
      } else if (bet.toUpperCase() != "CHO" && bet.toUpperCase() != "HAN") {
        stdout.write(
            "Please Enter CHO (even) or HAN (odd) for the sum of the dice > ");
      } else {
        break;
      }
    }

    print("\n\t\t ..... The dealer is about to reveal the dice ..... \n");

    await Future.delayed(Duration(seconds: 1));

    print(
        "$dice1 - ${JAPANESE_NUMBERS[dice1]} and $dice2 - ${JAPANESE_NUMBERS[dice2]}");

    // the user bet the sum of the dice will be even
    int sum = dice1 + dice2;
    if (sum.isEven && bet.toUpperCase() == "CHO" ||
        sum.isOdd && bet.toUpperCase() == "HAN") {
      print(
          "You bet right. the sum of the dice is ${sum.isEven ? "even" : "odd"}");
      int house = ((bid * 10) / 100).floor();
      print("\nthe house takes 10% of $bid = $house\n");
      bid -= house;
      balance += bid;
    } else {
      print("Oops!!! the sum of the dice is odd");
      balance -= bid;
    }

    if (balance <= 0) {
      print("\nYou have run out of money");
      print("thanks for gambling");
      quit = true;
    } else {
      stdout.write("Do you want to quit? (y - YES or n - NO) > ");
      String? q = stdin.readLineSync();
      quit = q!.toUpperCase() == "Y" ? true : false;
      print("\n");
    }
  }
}

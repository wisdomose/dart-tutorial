import "dart:io";

List<String> week = const [
  "monday",
  "tuesday",
  "wednesday",
  "thursday",
  "friday",
  "saturday",
  "sunday"
];
// these regex are not perfect
const String yearRegex = r"^[0-9]{4}$";
const String monthRegex = r"^[1-9]$|^[1-2][0-2]$";
void main() {
  List<int> thirty = [9, 4, 6, 11];
  int year, month = 0;

  while (true) {
    // loops until user enters a valid year
    stdout.write("Enter a year > ");
    String? yr = stdin.readLineSync();
    if (yr != null) {
      if (yr.contains(RegExp(yearRegex))) {
        year = int.parse(yr);
        break;
      }
    }
  }

  while (true) {
    // loop until user enters a valid month
    stdout.write("Enter a month > ");
    String? mth = stdin.readLineSync();
    if (mth != null) {
      if (mth.contains(RegExp(monthRegex))) {
        month = int.parse(mth);
        break;
      }
    }
  }

  DateTime now = DateTime(year, month);

  int run = 1;
  int day = 1;
  if (!thirty.indexOf(now.month).isNegative) {
    day = 30;
  }
  if (now.month == 2) {
    now.year % 4 == 0 ? day = 29 : day = 28;
  } else {
    day = 31;
  }
  print("\n\t\t\t\t\t\tCALENDAR for $year / $month");

  // print week header monday, tuesday ...
  for (var item in week) {
    stdout.write(
        "+    ${"${item}"}    "); // stdout.write dosen't print a newline character at the end of strings
  }
  stdout.write("+");
  print("");

  // make sure you start with monday
  while (now.weekday != 1) {
    now = DateTime(year, month, --run);
  }

  // print in groups of 7
  for (int i = run; i <= day; i += 7) {
    // each child loop prints a line seven times for the seven days of the week
    for (int j = 0; j < 7; j++) {
      stdout.write("+${"${"-" * 15}"}");
    }
    stdout.write("+");
    print("");
    for (int j = 0; j < 7; j++) {
      stdout.write("${"|\t\t"}");
    }
    stdout.write("|");
    print("");
    for (int j = 0; j < 7; j++) {
      now = DateTime(year, month, run++);
      stdout.write("${"|\t${now.day}\t"}");
    }
    stdout.write("|");
    print("");
    for (int j = 0; j < 7; j++) {
      stdout.write("${"|\t\t"}");
    }
    stdout.write("|");
    print("");
  }
  // prints the closing line
  print("+${"${"-" * 15}+" * 7}");
}

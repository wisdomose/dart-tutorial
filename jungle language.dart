final sentence = "the big blAck fox jumps over the lazy dog";
final vowels = {"a": "1", "e": "2", "i": "3", "o": "4", "u": "5"};

String convert() {
  List<String> tempSentence = sentence.split("");
  for (var i = 0; i < tempSentence.length; i++) {
    // contert the current letter to lowercase
    // it should be lower case because the vowels are in lowercase
    String lowerCase = tempSentence[i].toLowerCase();

    if (vowels.containsKey(lowerCase)) {
      tempSentence[i] = vowels[lowerCase]!;
    }
  }

  return tempSentence.join("");
}

void main() {
  print(convert());
}

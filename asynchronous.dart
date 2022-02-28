import "dart:io";
import "dart:convert";

Future<void> main() async {
  final path = "./j.json";
  try {
    final res = await File(path).readAsString();
    var t = jsonDecode(res);
    print(t["subjectsTeaching"][0]["subject"]);
  } catch (e) {
    print("error happened");
  }
  var d = await Future.delayed(const Duration(seconds: 1), () => "hey");
  print(d);
}

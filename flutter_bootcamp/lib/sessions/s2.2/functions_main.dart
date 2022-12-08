import 'package:flutter_bootcamp/sessions/s2.2/functions.dart';

void main() {
  var func = Functions();

  func.welcome();
  String retRes = func.welcome1();
  print("Returned res: $retRes");

  func.welcome2("Alperen");

  int retSum = func.sum(10, 20);
  print("Returned sum: $retSum");
}

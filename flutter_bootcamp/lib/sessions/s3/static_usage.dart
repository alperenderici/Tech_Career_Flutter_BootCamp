import 'package:flutter_bootcamp/sessions/s3/aclass.dart';

void main() {
  var a = AClass();

  //Standart usage
  // print(a.method);
  // a.method();

  //Visual object - unnamed object
  // print(AClass().variable);//1. object
  // AClass().method();//2.object

  //Static usage
  print(AClass.variable);
  AClass.method();
}

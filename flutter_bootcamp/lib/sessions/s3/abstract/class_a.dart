import 'package:flutter_bootcamp/sessions/s3/abstract/my_interface.dart';

//implements take from many classes (with"," a,b,c)
class ClassA implements MyInterface {
  //have to implement all from abstract class
  @override
  int variable = 10;

  @override
  void method1() {
    print("method1 runs");
  }

  @override
  String method2() {
    return "method2 runs";
  }
}

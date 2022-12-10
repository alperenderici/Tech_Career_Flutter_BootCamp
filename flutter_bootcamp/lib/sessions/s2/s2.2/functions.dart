class Functions {
  //void
  void welcome() {
    String res = "Welcome Alperen";
    print(res);
  }

  //return
  String welcome1() {
    String res = "Welcome Alperen";
    print(res);
    return res;
  }

  //parameter
  void welcome2(String name) {
    String res = "Welcome $name";
    print(res);
  }

  int sum(int num1, int num2) {
    int sum = num1 + num2;
    return sum;
  }

  // //overloading
  // double sum(double num1, double num2) {
  //   double sum = num1 + num2;
  //   return sum;
  // }
}

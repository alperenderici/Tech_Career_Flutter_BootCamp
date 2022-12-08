import 'package:flutter_bootcamp/homeworks/hw2/homework2.dart';

void main() {
  var hw2 = Homework2();

  double res = hw2.interiorAngleCalculator(3);
  print(res);

  hw2.salary(20);

  int park = hw2.parkingFee(3);
  print(park);

  double convertedC = hw2.celciusToFahrenhiet(30);
  print(convertedC);

  hw2.perimeter(10, 5);

  int factor = hw2.factorCalc(4);
  print(factor);

  hw2.aFinder("Alperen");
}

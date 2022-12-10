import 'package:flutter_bootcamp/sessions/s2/s2.2/car.dart';

void main() {
  var bmw = Car(color: "Blue", speed: 100, isWorking: true);
  // bmw.color = "Blue";
  // bmw.speed = 100;
  // bmw.isWorking = true;

  bmw.getData();
  bmw.stopCar();
  bmw.getData();
  bmw.startCar();
  bmw.getData();
  bmw.speedUp(100);
  bmw.getData();
  bmw.speedDown(25);
  bmw.getData();

  var sahin = Car(color: "White", speed: 0, isWorking: false);
  // sahin.color = "White";
  // sahin.speed = 0;
  // sahin.isWorking = false;
  // print("Color: ${sahin.color}");
  // print("Speed: ${sahin.speed}");
  // print("Is working: ${sahin.isWorking}");
  sahin.getData();
  sahin.startCar();
  sahin.getData();
  sahin.speedUp(40);
  sahin.getData();
  sahin.speedDown(20);
  sahin.getData();
}

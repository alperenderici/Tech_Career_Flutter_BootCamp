// ignore_for_file: public_member_api_docs, sort_constructors_first
class Car {
  // late String color;
  // late int speed;
  // late bool isWorking;
  String color;
  int speed;
  bool isWorking;

  Car({
    required this.color,
    required this.speed,
    required this.isWorking,
  });

  void getData() {
    print("-------------------------");
    print("Color: ${color}");
    print("Speed: ${speed}");
    print("Is working: ${isWorking}");
  }

  void startCar() {
    isWorking = true;
    speed = 5;
  }

  void stopCar() {
    isWorking = false;
    speed = 0;
  }

  void speedUp(int kmh) {
    // speed = speed + kmh;
    speed += kmh;
  }

  void speedDown(int kmh) {
    // speed = speed + kmh;
    speed -= kmh;
  }
}

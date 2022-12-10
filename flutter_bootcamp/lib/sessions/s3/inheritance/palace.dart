import 'package:flutter_bootcamp/sessions/s3/inheritance/home.dart';

class Palace extends Home {
  int towerNumber;

  Palace({
    required this.towerNumber,
    required int windowNum,
  }) : super(windowNumber: windowNum);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bootcamp/sessions/s3/inheritance/home.dart';

class Villa extends Home {
  bool hasGarage;

  Villa({
    required this.hasGarage,
    required int windowNum,
  }) : super(windowNumber: windowNum);
}

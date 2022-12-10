import 'package:flutter_bootcamp/sessions/s3/can_size.dart';

void main() {
  calcFee(30, CanSize.medium);
}

void calcFee(int num, CanSize size) {
  switch (size) {
    case CanSize.small:
      print("Ucret: ${num * 14.5} tl");
      break;
    case CanSize.medium:
      print("Ucret: ${num * 15.5} tl");
      break;
    case CanSize.large:
      print("Ucret: ${num * 16.5} tl");
      break;
  }
}

import 'package:flutter_bootcamp/sessions/s3/inheritance/home.dart';
import 'package:flutter_bootcamp/sessions/s3/inheritance/palace.dart';
import 'package:flutter_bootcamp/sessions/s3/inheritance/villa.dart';

void main() {
  var topkapiPalace = Palace(towerNumber: 10, windowNum: 300);
  print(topkapiPalace.towerNumber); //own property
  print(topkapiPalace.windowNumber); //prop. comes from inheritence

  var bogazVilla = Villa(hasGarage: true, windowNum: 40);
  print(bogazVilla.hasGarage); //own property
  print(bogazVilla.windowNumber); //prop. comes from inheritence

  //Type casting
  //Type controll
  if (topkapiPalace is Palace) {
    print("is Palace");
  } else {
    print("is not Palace");
  }

  //Downcasting
  var house = Home(windowNumber: 5);
  var palace = house as Palace;

  //Upcasting
  var place = Palace(towerNumber: 3, windowNum: 100);
  Home home1 = palace;
}

import 'package:flutter_bootcamp/sessions/s3/override/animal.dart';
import 'package:flutter_bootcamp/sessions/s3/override/cat.dart';
import 'package:flutter_bootcamp/sessions/s3/override/dog.dart';
import 'package:flutter_bootcamp/sessions/s3/override/mammal.dart';

void main(List<String> args) {
  var animal = Animal();
  var mammal = Mammal();
  var cat = Cat();
  var dog = Dog();

  animal.sound(); //no inheritance, runs own method
  mammal.sound(); //has inheritance , runs upper class methods
  cat.sound(); //has inheritance but runs own methods
  dog.sound(); //has inheritance but runs own methods
}

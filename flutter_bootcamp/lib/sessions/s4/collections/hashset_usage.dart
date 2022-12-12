import 'dart:collection';

void main() {
  //Definition
  var carPlates = HashSet.from([16, 34, 6]);
  var fruits = HashSet<String>();

  //add data
  fruits.add("Muz");
  fruits.add("Kiraz");
  fruits.add("Elma");
  print(fruits);

  fruits.add("Amasya Elmasi"); // if it is Elma prints same as line 12
  print(fruits);

  String fruit = fruits.elementAt(2);
  print(fruit);

  for (var f in fruits) {
    print("Sonuc: $f");
  }

  for (var i = 0; i < fruits.length; i++) {
    print("$i => ${fruits.elementAt(i)}");
  }

  fruits.remove("Muz");
  print(fruits);
}

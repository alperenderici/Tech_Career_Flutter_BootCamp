void main() {
  //definition
  var carPlates = [16, 34, 6];
  var fruits = <String>[];

  //add data
  fruits.add("Muz"); //0
  fruits.add("Kiraz"); //1
  fruits.add("Elma"); //2
  print(fruits);

  //Update
  fruits[1] = "Yeni Kiraz";
  print(fruits);

  //Insert
  fruits.insert(1, "Portakal");
  print(fruits);

  //Read data
  String fruit = fruits[2];
  print(fruits);

  //For each
  for (var f in fruits) {
    print("Sonuc: $f");
  }

  //if index needed in for each
  for (var i = 0; i < fruits.length; i++) {
    print("$i => ${fruits[i]}");
  }

  print(fruits.isEmpty);
  print(fruits.contains("Muz"));

  var list = fruits.reversed.toList();
  print(fruits);

  fruits.sort();
  print(fruits);

  //Delete data
  fruits.removeAt(1);
  print(fruits);

  fruits.clear();
  print(fruits);
}

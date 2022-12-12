import 'dart:collection';

void main() {
  //Definition
  var numbers = {"One": 1, "Two": 2};
  var provinces = HashMap<int, String>();

  //add data
  provinces[35] = "Izmir";
  provinces[34] = "Istanbul";
  print(provinces);

  //update
  provinces[35] = "Guzel Izmir";
  print(provinces);

  String province = provinces[35]!;
  print(province);

  print(provinces.length);
  print(provinces.isEmpty);
  print(provinces.containsKey(35));
  print(provinces.containsValue("Istanbul"));

  var keys = provinces.keys;
  for (var k in keys) {
    print("$k => ${provinces[k]}");
  }

  provinces.remove(35);
  print(provinces);

  provinces.clear();
  print(provinces);
}

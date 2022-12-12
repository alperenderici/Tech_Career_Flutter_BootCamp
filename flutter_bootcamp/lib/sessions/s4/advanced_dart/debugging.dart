void main() {
  //1. Compile error
  //String x = 10;

  //2. Runtime error : Exception
  var list = <String>[];
  list.add("Ahmet"); //0. index
  list.add("Zeynep"); //1. index

  //try catch exception handling
  try {
    String name = list[3]; //with 'list[1]'(0,1) no error
    print("Gelen isim: $name");
  } catch (e) {
    print("Listenin boyutunu astiniz");
  }
}

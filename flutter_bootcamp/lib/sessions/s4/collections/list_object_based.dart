import 'package:flutter_bootcamp/sessions/s4/collections/products.dart';

void main() {
  var p1 = Products(id: 1, name: "TV", price: 8000);
  var p2 = Products(id: 2, name: "Laptop", price: 20000);
  var p3 = Products(id: 3, name: "Saat", price: 3000);

  var productsList = <Products>[];

  productsList.add(p1);
  productsList.add(p2);
  productsList.add(p3);

  for (var p in productsList) {
    print("Id: ${p.id}\nAdi: ${p.name}\nFiyat: ${p.price}\n");
    print("------------------------------------------------");
  }

  //Sorting
  //Price : Ascending
  Comparator<Products> sorting1 = ((a, b) => a.price.compareTo(b.price));
  productsList.sort(sorting1);
  print("--------------Price : Ascending------------");
  for (var p in productsList) {
    print("Id: ${p.id}\nAdi: ${p.name}\nFiyat: ${p.price}\n");
    print("------------------------------------------------");
  }

  //Price : Descending
  Comparator<Products> sorting2 = ((a, b) => b.price.compareTo(a.price));
  productsList.sort(sorting2);
  print("--------------Price : Descending------------");
  for (var p in productsList) {
    print("Id: ${p.id}\nAdi: ${p.name}\nFiyat: ${p.price}\n");
    print("------------------------------------------------");
  }

  //Word : Ascending
  Comparator<Products> sorting3 = ((a, b) => a.name.compareTo(b.name));
  productsList.sort(sorting3);
  print("--------------Word : Ascending------------");
  for (var p in productsList) {
    print("Id: ${p.id}\nAdi: ${p.name}\nFiyat: ${p.price}\n");
    print("------------------------------------------------");
  }

  //Word : Descending
  Comparator<Products> sorting4 = ((a, b) => b.name.compareTo(a.name));
  productsList.sort(sorting4);
  print("--------------Word : Descending------------");
  for (var p in productsList) {
    print("Id: ${p.id}\nAdi: ${p.name}\nFiyat: ${p.price}\n");
    print("------------------------------------------------");
  }

  //Filter
  //where = if, where comes from db
  Iterable<Products> filter1 = productsList.where((productObject) =>
      productObject.price > 5000 &&
      productObject.price < 10000); //element = product object
  var list1 = filter1.toList();
  print("--------------Filter------------");
  for (var p in list1) {
    print("Id: ${p.id}\nAdi: ${p.name}\nFiyat: ${p.price}\n");
    print("------------------------------------------------");
  }

  //Filter string
  Iterable<Products> filter2 = productsList.where((productObject) =>
      productObject.name.contains("at")); //element = product object
  var list2 = filter2.toList();
  print("--------------Filter 2------------");
  for (var p in list2) {
    print("Id: ${p.id}\nAdi: ${p.name}\nFiyat: ${p.price}\n");
    print("------------------------------------------------");
  }
}

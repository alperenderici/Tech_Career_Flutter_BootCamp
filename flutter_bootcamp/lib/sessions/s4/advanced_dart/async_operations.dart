Future<void> main() async {
  print("Verilerin alinmasi bekleniyor...");

  var data = await getData();
  print("Veri aliniyor...");

  print("Alinan veri: $data");
}

Future<String> getData() async {
  for (var i = 1; i < 6; i++) {
    Future.delayed(
        Duration(seconds: i), (() => print("Alinan veri miktari: %${i * 20}")));
  }
  return Future.delayed(Duration(seconds: 5), () => "Veritabani ver ikumesi");
}

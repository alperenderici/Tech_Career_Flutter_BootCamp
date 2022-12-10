//null safety
void main() {
  String? name = null;

  // name = "Alperen";
  //if it is not null it is not going to crash
  print("Yontem 1: ${name?.toUpperCase()}");

  //avoids from warning but may error will occur
  print("Yontem 2: ${name!.toUpperCase()}");

  //check if it is null
  if (name != null) {
    print("Yontem 3: ${name.toUpperCase()}");
  } else {
    print("Null");
  }
}

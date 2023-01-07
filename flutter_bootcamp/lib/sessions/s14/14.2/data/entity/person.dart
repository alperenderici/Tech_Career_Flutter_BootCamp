class Person {
  String person_id;
  String person_name;
  String person_num;

  Person({
    required this.person_id,
    required this.person_name,
    required this.person_num,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      person_id: json["kisi_id"] as String,
      person_name: json["kisi_ad"] as String,
      person_num: json["kisi_tel"] as String,
    );
  }
}

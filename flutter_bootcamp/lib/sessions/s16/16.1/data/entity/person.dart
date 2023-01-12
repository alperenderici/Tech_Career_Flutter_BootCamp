class Person {
  String person_id;
  String person_name;
  String person_num;

  Person({
    required this.person_id,
    required this.person_name,
    required this.person_num,
  });

  factory Person.fromJson(String key, Map<dynamic, dynamic> json) {
    return Person(
        person_id: key,
        person_name: json['kisi_ad'] as String,
        person_num: json['kisi_num'] as String);
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/sessions/s9/9.1/data/entity/person.dart';

class PersonDetailPage extends StatefulWidget {
  Person person;

  PersonDetailPage({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  State<PersonDetailPage> createState() => _PersonDetailPageState();
}

class _PersonDetailPageState extends State<PersonDetailPage> {
  var tfPersonName = TextEditingController();
  var tfPersonNum = TextEditingController();

  @override
  void initState() {
    super.initState();
    var person = widget.person;
    tfPersonName.text = person.person_name;
    tfPersonNum.text = person.person_num;
  }

  Future<void> update(
      int person_id, String person_name, String person_num) async {
    print("Kişi Güncelle: $person_id - $person_name - $person_num");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Detay"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfPersonName,
                decoration: const InputDecoration(hintText: "Kişi Ad"),
              ),
              TextField(
                controller: tfPersonNum,
                decoration: const InputDecoration(hintText: "Kişi Tel"),
              ),
              ElevatedButton(
                onPressed: () {
                  update(
                    widget.person.person_id,
                    tfPersonName.text,
                    tfPersonNum.text,
                  );
                },
                child: const Text("GÜNCELLE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PersonRecordPage extends StatefulWidget {
  const PersonRecordPage({super.key});

  @override
  State<PersonRecordPage> createState() => _PersonRecordPageState();
}

class _PersonRecordPageState extends State<PersonRecordPage> {
  var tfPersonName = TextEditingController();
  var tfPersonNum = TextEditingController();

  Future<void> save(String person_name, String person_num) async {
    print("Kişi kaydet: $person_name - $person_num");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Kayıt"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfPersonName,
                decoration: InputDecoration(hintText: "Kişi Ad"),
              ),
              TextField(
                controller: tfPersonNum,
                decoration: InputDecoration(hintText: "Kişi Tel"),
              ),
              ElevatedButton(
                onPressed: () {
                  save(tfPersonName.text, tfPersonNum.text);
                },
                child: const Text("KAYDET"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

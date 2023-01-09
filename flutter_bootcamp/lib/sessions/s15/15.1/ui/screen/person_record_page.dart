import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/sessions/s15/15.1/ui/cubit/person_record_cubit.dart';

class PersonRecordPage extends StatefulWidget {
  const PersonRecordPage({super.key});

  @override
  State<PersonRecordPage> createState() => _PersonRecordPageState();
}

class _PersonRecordPageState extends State<PersonRecordPage> {
  var tfPersonName = TextEditingController();
  var tfPersonNum = TextEditingController();

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
                  context
                      .read<PersonRecordCubit>()
                      .save(tfPersonName.text, tfPersonNum.text);
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

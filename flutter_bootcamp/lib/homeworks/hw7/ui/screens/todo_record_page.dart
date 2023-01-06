import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/homeworks/hw7/ui/cubit/homepage_cubit.dart';
import 'package:flutter_bootcamp/homeworks/hw7/ui/cubit/todo_record_cubit.dart';
import 'package:flutter_bootcamp/homeworks/hw7/ui/screens/homepage.dart';

class TodoRecordPage extends StatefulWidget {
  const TodoRecordPage({super.key});

  @override
  State<TodoRecordPage> createState() => _TodoRecordPageState();
}

class _TodoRecordPageState extends State<TodoRecordPage> {
  var tfPersonName = TextEditingController();
  var tfPersonNum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Kayıt"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfPersonName,
                decoration: const InputDecoration(hintText: "Todo Ad"),
              ),
              TextField(
                controller: tfPersonNum,
                decoration: const InputDecoration(hintText: "Todo Açıklama"),
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<TodoRecordCubit>()
                      .save(tfPersonName.text, tfPersonNum.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  ).then((value) {
                    context.read<HomePageCubit>().list();
                  });
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

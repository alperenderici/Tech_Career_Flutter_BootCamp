import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/homeworks/hw7/data/entity/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/homeworks/hw7/ui/cubit/homepage_cubit.dart';
import 'package:flutter_bootcamp/homeworks/hw7/ui/cubit/todo_detail_cubit.dart';
import 'package:flutter_bootcamp/homeworks/hw7/ui/screens/homepage.dart';

class TodoDetailPage extends StatefulWidget {
  Todo todo;

  TodoDetailPage({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  State<TodoDetailPage> createState() => _TodoDetailPageState();
}

class _TodoDetailPageState extends State<TodoDetailPage> {
  var tfPersonName = TextEditingController();
  var tfPersonNum = TextEditingController();

  @override
  void initState() {
    super.initState();
    var todo = widget.todo;
    tfPersonName.text = todo.todo_name;
    tfPersonNum.text = todo.todo_description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Detay"),
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
                decoration: const InputDecoration(hintText: "Todo Açıklama"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<TodoDetailCubit>().update(
                        widget.todo.todo_id,
                        tfPersonName.text,
                        tfPersonNum.text,
                      );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  ).then((value) {
                    context.read<HomePageCubit>().list();
                  });
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

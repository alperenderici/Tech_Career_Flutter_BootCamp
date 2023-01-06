import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/homeworks/hw7/data/entity/todo.dart';
import 'package:flutter_bootcamp/homeworks/hw7/ui/cubit/homepage_cubit.dart';
import 'package:flutter_bootcamp/homeworks/hw7/ui/screens/todo_detail_page.dart';
import 'package:flutter_bootcamp/homeworks/hw7/ui/screens/todo_record_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().list();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? TextField(
                decoration: const InputDecoration(hintText: "Ara"),
                onChanged: (searchResult) {
                  print("Todo ara: $searchResult");
                  context.read<HomePageCubit>().search(searchResult);
                },
              )
            : const Text("Todo's"),
        actions: [
          isSearch
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = false;
                      context.read<HomePageCubit>().list();
                    });
                  },
                  icon: const Icon(Icons.cancel),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = true;
                    });
                  },
                  icon: const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<HomePageCubit, List<Todo>>(
        builder: (context, todoList) {
          if (todoList.isNotEmpty) {
            return ListView.builder(
              itemCount: todoList.length,
              itemBuilder: ((context, index) {
                var todo = todoList[index]; //key code!
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) =>
                            TodoDetailPage(todo: todo)), //ref
                      ),
                    ).then((value) {
                      context.read<HomePageCubit>().list();
                    });
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        todo.todo_name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20),
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    todo.todo_description,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            "${todo.todo_name} silinsin mi?"),
                                        action: SnackBarAction(
                                            label: "Evet",
                                            onPressed: () {
                                              print(
                                                  "Todo sil: ${todo.todo_id}");
                                              context
                                                  .read<HomePageCubit>()
                                                  .delete(todo.todo_id);
                                            }),
                                      ),
                                    );
                                  },
                                  icon: const Card(
                                    color: Colors.white,
                                    child: Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TodoRecordPage(),
            ),
          ).then((value) {
            context.read<HomePageCubit>().list();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

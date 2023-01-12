import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/sessions/s16/16.1/data/entity/person.dart';
import 'package:flutter_bootcamp/sessions/s16/16.1/ui/cubit/homepage_cubit.dart';
import 'package:flutter_bootcamp/sessions/s16/16.1/ui/screen/person_detail_page.dart';
import 'package:flutter_bootcamp/sessions/s16/16.1/ui/screen/person_record_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().showAllPerson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? TextField(
                decoration: const InputDecoration(hintText: "Ara"),
                onChanged: (searchResult) {
                  context.read<HomePageCubit>().search(searchResult);
                },
              )
            : const Text("Kişiler"),
        actions: [
          isSearch
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = false;
                      context.read<HomePageCubit>().showAllPerson();
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
      body: BlocBuilder<HomePageCubit, List<Person>>(
        builder: (context, personList) {
          if (personList.isNotEmpty) {
            return ListView.builder(
              itemCount: personList.length,
              itemBuilder: ((context, index) {
                var person = personList[index]; //key code!
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) =>
                            PersonDetailPage(person: person)), //ref
                      ),
                    ).then((value) {
                      context.read<HomePageCubit>().showAllPerson();
                    });
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "${person.person_name} - ${person.person_num}"),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text("${person.person_name} silinsin mi?"),
                                action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: () {
                                      context
                                          .read<HomePageCubit>()
                                          .delete(person.person_id);
                                    }),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.black54,
                          ),
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
              builder: (context) => const PersonRecordPage(),
            ),
          ).then((value) {
            context.read<HomePageCubit>().showAllPerson();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

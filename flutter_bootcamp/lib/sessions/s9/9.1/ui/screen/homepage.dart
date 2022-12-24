import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/sessions/s9/9.1/data/entity/person.dart';
import 'package:flutter_bootcamp/sessions/s9/9.1/ui/screen/person_detail_page.dart';
import 'package:flutter_bootcamp/sessions/s9/ui/screen/person_record_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;

  Future<List<Person>> showAllPerson() async {
    var personList = <Person>[];
    var p1 = Person(person_id: 1, person_name: "Ahmet", person_num: "1111");
    var p2 = Person(person_id: 2, person_name: "Zeynep", person_num: "2222");
    var p3 = Person(person_id: 3, person_name: "Beyza", person_num: "3333");
    personList.add(p1);
    personList.add(p2);
    personList.add(p3);
    return personList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? TextField(
                decoration: const InputDecoration(hintText: "Ara"),
                onChanged: (searchResult) {
                  print("Kişi ara: $searchResult");
                },
              )
            : const Text("Kişiler"),
        actions: [
          isSearch
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = false;
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
      //* Session 9.1
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       ElevatedButton(
      //         onPressed: () {
      //           var person = Person(
      //               person_id: 1, person_name: "Ahmet", person_num: "11111");
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => PersonDetailPage(
      //                 person: person,
      //               ),
      //             ),
      //           );
      //         },
      //         child: const Text("DETAY"),
      //       ),
      //     ],
      //   ),
      // ),
      body: FutureBuilder<List<Person>>(
        future: showAllPerson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var personList = snapshot.data;
            return ListView.builder(
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
                    );
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
                                      print("Kisi sil: ${person.person_id}");
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
              itemCount: personList!.length,
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
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ConstListPage extends StatefulWidget {
  const ConstListPage({super.key});

  @override
  State<ConstListPage> createState() => _ConstListPageState();
}

class _ConstListPageState extends State<ConstListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sabit Liste"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1,
        children: [
          ListTile(
            leading: const Icon(Icons.sunny),
            title: const Text("Güneş"),
            subtitle: const Text("Güneş Alt Başlık"),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("Güneş Tıklandı");
            },
          ),
          ListTile(
            leading: const Icon(Icons.brightness_2),
            title: const Text("Ay"),
            subtitle: const Text("Ay Alt Başlık"),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("Ay Tıklandı");
            },
          ),
          GestureDetector(
            onTap: () {
              print("Yıldız tıklandı");
            },
            child: Card(
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 30),
                    child: Icon(
                      Icons.star,
                      color: Colors.black45,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Yıldız",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Yıldız Alt Başlık",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(right: 13),
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

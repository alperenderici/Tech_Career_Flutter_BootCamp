// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/sessions/s10/10.1/foods.dart';

class FoodsDetailPage extends StatefulWidget {
  Foods food;

  FoodsDetailPage({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  State<FoodsDetailPage> createState() => _FoodsDetailPageState();
}

class _FoodsDetailPageState extends State<FoodsDetailPage> {
  @override
  Widget build(BuildContext context) {
    var f = widget.food;

    return Scaffold(
      appBar: AppBar(
        title: Text(f.name),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/food/${f.imageName}"),
            Text(
              "${f.price} ₺",
              style: const TextStyle(fontSize: 48, color: Colors.blue),
            ),
            ElevatedButton(
              onPressed: () {
                print("${f.name} siparis edildi");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: const Text(
                "SİPARİŞ VER",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

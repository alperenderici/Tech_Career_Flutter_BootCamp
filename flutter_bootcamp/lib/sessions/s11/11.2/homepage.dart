import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp/sessions/s11/11.2/homepage_cubit.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  int result = 0;

  var num1 = TextEditingController();

  var num2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BloC Kullanımı"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<HomePageCubit, int>(builder: (context, result) {
                return Text(
                  result.toString(),
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                );
              }),
              TextField(
                controller: num1,
                decoration: const InputDecoration(
                  hintText: "Sayı 1",
                ),
              ),
              TextField(
                controller: num2,
                decoration: const InputDecoration(
                  hintText: "Sayı 2",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      String receivedNum1 = num1.text;
                      String receivedNum2 = num2.text;
                      context
                          .read<HomePageCubit>()
                          .sum(receivedNum1, receivedNum2);
                      // int newNum1 = int.parse(receivedNum1);
                      // int newNum2 = int.parse(receivedNum2);
                      // int sum = newNum1 + newNum2;
                      // setState(() {
                      //   result = sum;
                      // });
                    },
                    child: const Text(
                      "Toplama",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String receivedNum1 = num1.text;
                      String receivedNum2 = num2.text;
                      context
                          .read<HomePageCubit>()
                          .mul(receivedNum1, receivedNum2);
                      // int newNum1 = int.parse(receivedNum1);
                      // int newNum2 = int.parse(receivedNum2);
                      // int mul = newNum1 * newNum2;
                      // setState(() {
                      //   result = mul;
                      // });
                    },
                    child: const Text(
                      "Çarpma",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

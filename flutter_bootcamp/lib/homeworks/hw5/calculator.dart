import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = "";
  double num = 0;
  bool onClick = false;

  List<String> numlist = ["0"];

  //"6+78+4" -> split -> 6,78,4

  sum(double num1, double num2) {
    //TODO BULMASI KOLAY OLSUN
    double sum = num1 + num2;
    display = sum.toString();
    return display;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: MediaQuery.of(context).size.height / 5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child:
                  onClick ? Text(numlist.toString()) : Text("${num.toInt()}"),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(65, 57, 56, 1),
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.zero,
                        // ),
                      ),
                      onPressed: () {
                        setState(() {
                          num = 0;
                          numlist.clear();
                          onClick = false;
                        });
                      },
                      child: Center(
                        child: onClick ? const Text("C") : const Text("AC"),
                      ),
                    ),
                  ),
                ),
                // Spacer(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(65, 57, 56, 1),
                      ),
                      onPressed: () {},
                      child: const Center(
                        child: Text("%"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(65, 57, 56, 1),
                      ),
                      onPressed: () {},
                      child: const Center(
                        child: Text("%"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      onPressed: () {},
                      child: const Center(
                        child: Text("/"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      onPressed: () {
                        setState(() {
                          num = 7;
                          onClick = true;
                        });
                      },
                      child: const Center(
                        child: Text("7"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      onPressed: () {
                        setState(() {
                          num = 8;
                          onClick = true;
                        });
                      },
                      child: const Center(
                        child: Text("8"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      onPressed: () {
                        setState(() {
                          num = 9;
                          onClick = true;
                        });
                      },
                      child: const Center(
                        child: Text("9"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      onPressed: () {},
                      child: const Center(
                        child: Text("x"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      onPressed: () {
                        setState(() {
                          num = 4;
                          onClick = true;
                        });
                      },
                      child: const Center(
                        child: Text("4"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      onPressed: () {
                        setState(() {
                          num = 5;
                          onClick = true;
                        });
                      },
                      child: const Center(
                        child: Text("5"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      onPressed: () {
                        setState(() {
                          num = 6;
                          onClick = true;
                        });
                      },
                      child: const Center(
                        child: Text("6"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      onPressed: () {},
                      child: const Center(
                        child: Text("-"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      onPressed: () {
                        setState(() {
                          // num = 1;
                          numlist.join("1");
                          onClick = true;
                        });
                      },
                      child: const Center(
                        child: Text("1"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      onPressed: () {
                        setState(() {
                          display = "2";
                          onClick = true;
                        });
                      },
                      child: const Center(
                        child: Text("2"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      onPressed: () {
                        setState(() {
                          num = 3;
                          onClick = true;
                        });
                      },
                      child: const Center(
                        child: Text("3"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      onPressed: () {
                        setState(() {
                          sum(double.parse(display), num);
                          onClick = true;
                        });
                      },
                      child: const Center(
                        child: Text("+"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      onPressed: () {
                        setState(() {
                          num = 0;
                          onClick = true;
                        });
                      },
                      child: const Center(
                        child: Text("0"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Center(
                        child: Text(","),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      onPressed: () {
                        setState(() {
                          //TODO BULMASI KOLAY OLSUN
                          // String result = sum.toString();
                          // display = result;
                        });
                      },
                      child: const Center(
                        child: Text("="),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

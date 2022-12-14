import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/sessions/s5/colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pizza",
          style: TextStyle(fontFamily: "Pacifico"),
        ),
        backgroundColor: mainColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            "Beef Cheese",
            style: TextStyle(
                fontSize: 36, color: mainColor, fontWeight: FontWeight.bold),
          ),
          Image.asset("assets/images/pizza_resim.png"),
          Row(
            //left => start - leading
            //right => end - trailing
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                child: Text(
                  "Cheese",
                  style: TextStyle(color: text1Color),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                child: Text(
                  "Sausage",
                  style: TextStyle(color: text1Color),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                child: Text(
                  "Olive",
                  style: TextStyle(color: text1Color),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                child: Text(
                  "Pepper",
                  style: TextStyle(color: text1Color),
                ),
              ),
            ],
          ),
          Text(
            "20 min",
            style: TextStyle(
                fontSize: 20, color: text2Color, fontWeight: FontWeight.bold),
          ),
          Text(
            "Beef Cheese",
            style: TextStyle(
                fontSize: 30, color: mainColor, fontWeight: FontWeight.bold),
          ),
          Text(
            "Meat lover, get ready to meet your pizza!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: text2Color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "\$ 5.98 ",
                style: TextStyle(
                    fontSize: 30,
                    color: mainColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: mainColor),
                  onPressed: () {},
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                      color: text1Color,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

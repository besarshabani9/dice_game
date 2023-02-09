import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(const MyApp());

// void main() {
//   runApp(
//     MyApp(),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dice Game"),
          centerTitle: true,
        ),
        body: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int leftDiceNo = 2;
  int rightDiceNo = 2;

  Future<void> onRoll() async {
    setState(() {
      leftDiceNo = Random().nextInt(6) + 1;
      rightDiceNo = Random().nextInt(5) + 1;
    });

    String gameResult = "";
    if (leftDiceNo > rightDiceNo) {
      gameResult = "Player 1 won!";
    } else if (leftDiceNo < rightDiceNo) {
      gameResult = "Player 2 won!";
    } else {
      gameResult = "It's a draw!";
    }

    await Future.delayed(const Duration(seconds: 1));

    Alert(context: context, title: "Dice Game", desc: gameResult, buttons: [
      DialogButton(
          child: const Text(
            "Play Again!",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Alert(context: context).dismiss();
          }),
    ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text(
                    "Player 1",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 100.0,
                    height: 50.0,
                    child: Divider(
                      color: Colors.white,
                      thickness: 2.0,
                    ),
                  ),
                  Image(
                    image: AssetImage("images/$leftDiceNo.png"),
                    width: 120,
                    height: 120,
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Player 2",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 100.0,
                    height: 50.0,
                    child: Divider(
                      color: Colors.white,
                      thickness: 2.0,
                    ),
                  ),
                  Image(
                    image: AssetImage("images/$rightDiceNo.png"),
                    width: 120,
                    height: 120,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200.0, 50.0),
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                onPressed: onRoll,
                child: const Text(
                  "Roll it!",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

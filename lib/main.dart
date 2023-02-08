import 'package:flutter/material.dart';
import 'dart:math';

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

  void onClick() {
    setState(() {
      leftDiceNo = Random().nextInt(6) + 1;
      rightDiceNo = Random().nextInt(5) + 1;

      if (leftDiceNo > rightDiceNo) {
      } else if (leftDiceNo < rightDiceNo) {
        //_winner = "Palyer 2 \nwon  this round";
      } else {
        //_winner = "No Winner this round";
      }
    });
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
                onPressed: onClick,
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

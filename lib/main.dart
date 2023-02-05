import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

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
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dice Game"),
          centerTitle: true,
        ),
        body: HomeScreen(),
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
  String _img1url = "images/1.png";
  String _img2url = "images/1.png";
  String _winner = "";

  void onClick() {
    this.setState(() {
      var ranNo1 = Random().nextInt(6) + 1;
      _img1url = "images/$ranNo1.png";
      var ranNo2 = Random().nextInt(5) + 1;
      _img2url = "images/$ranNo2.png";
      if (ranNo1 > ranNo2) {
        _winner = "Palyer 1 \nwon this round";
      } else if (ranNo1 < ranNo2) {
        _winner = "Palyer 2 \nwon  this round";
      } else {
        _winner = "No Winner this round";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: const Text(
                  "Player 1",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: const Text(
                  "Player 1",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: Image(
                  image: AssetImage(_img1url),
                  width: 120,
                  height: 120,
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Image(
                  image: AssetImage(_img2url),
                  width: 120,
                  height: 120,
                ),
              ),
            ],
          ),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: onClick,
              child: Text(
                "Roll it!",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Text(
              _winner,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';

void startTimer() {
  const onesec = Duration(seconds: 1);
}

class GameStart extends StatefulWidget {
  const GameStart({Key? key}) : super(key: key);

  @override
  _GameStartState createState() => _GameStartState();
}

class _GameStartState extends State<GameStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff072540),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.6),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(color: Colors.grey),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.5),
            child: Container(
              height: 100,
              width: 300,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}

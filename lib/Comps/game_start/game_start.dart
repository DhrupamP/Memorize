// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:memorizegame/Styles/constants.dart';

class GameStart extends StatefulWidget {
  const GameStart({Key? key}) : super(key: key);

  @override
  _GameStartState createState() => _GameStartState();
}

class _GameStartState extends State<GameStart> {
  int num = 0;
  int _start = 5;

  @override
  void initState() {
    super.initState();
    startTimer();
    num += generateRandom(5);
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    Timer _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            Navigator.pushNamed(context, '/gameend');
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  int generateRandom(int lvl) {
    int temp = 0;
    for (int i = 1; i <= lvl; i++) {
      temp = 10 * temp + Random().nextInt(9);
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGround,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.6),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: kLightBlue,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(2, 2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  _start.toString(),
                  style: const TextStyle(fontSize: 65, color: Colors.white),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.5),
            child: Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                color: kLightBlue,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(1, 1),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  num.toString(),
                  style: TextStyle(fontSize: 65, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

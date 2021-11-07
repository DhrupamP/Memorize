import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

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
      backgroundColor: const Color(0xff072540),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.6),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(color: Colors.grey),
              child: Center(
                child: Text(
                  _start.toString(),
                  style: const TextStyle(fontSize: 50, color: Colors.red),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.5),
            child: Container(
              height: 100,
              width: 300,
              color: Colors.grey,
              child: Center(child: Text(num.toString())),
            ),
          )
        ],
      ),
    );
  }
}

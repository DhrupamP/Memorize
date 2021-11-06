import 'package:flutter/material.dart';
import 'dart:async';

class GameStart extends StatefulWidget {
  const GameStart({Key? key}) : super(key: key);
  //initstate kyu nai aa rha?

  @override
  _GameStartState createState() => _GameStartState();
}

class _GameStartState extends State<GameStart> {
  late Timer _timer;
  int _start = 10;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
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
            ),
          )
        ],
      ),
    );
  }
}

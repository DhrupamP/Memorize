import 'dart:async';

import 'package:flutter/material.dart';

int _start = 5;

class GameEnd extends StatefulWidget {
  const GameEnd({Key? key}) : super(key: key);

  @override
  _GameEndState createState() => _GameEndState();
}

class _GameEndState extends State<GameEnd> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    Timer _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            // Navigator.pushNamed(context, '/gameend');
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
      backgroundColor: Color(0xff072540),
      body: Align(
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
    );
  }
}

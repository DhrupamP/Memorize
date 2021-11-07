// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memorizegame/Styles/constants.dart';

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
      resizeToAvoidBottomInset: false,
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
            alignment: Alignment(0, 0.05),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50, color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPink),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPink),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

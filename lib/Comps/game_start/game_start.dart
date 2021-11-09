// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:math';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'package:memorizegame/Styles/constants.dart';
import 'package:memorizegame/globals.dart' as globals;

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
    num += generateRandom(globals.lvl);
    globals.qn = num;
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    Timer _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            Navigator.popAndPushNamed(context, '/gameend');
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
  void dispose() {
    super.dispose();
  }

  final slider = CircularCountDownTimer(
    duration: 5,
    initialDuration: 0,
    controller: CountDownController(),
    width: 210,
    height: 210,
    ringColor: kLightBlue,
    ringGradient: null,
    fillColor: kBlue,
    fillGradient: null,
    backgroundColor: kLightBlue,
    backgroundGradient: null,
    strokeWidth: 20.0,
    strokeCap: StrokeCap.round,
    textFormat: CountdownTextFormat.S,
    isReverse: false,
    isReverseAnimation: false,
    isTimerTextShown: true,
    autoStart: true,
    onStart: () {
      print('Countdown Started');
    },
    onComplete: () {
      print('Countdown Ended');
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGround,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.6),
            child: slider,
          ),
          Align(
            alignment: Alignment(0, -0.57),
            child: Container(
              height: 170,
              width: 170,
              decoration: BoxDecoration(
                color: kLightBlue,
                borderRadius: BorderRadius.circular(85),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _start.toString(),
                    style: GoogleFonts.pressStart2p(
                        fontSize: 60, color: Colors.red),
                  ),
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
                  style: GoogleFonts.pressStart2p(
                      fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

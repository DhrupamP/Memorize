// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:memorizegame/Styles/constants.dart';
import 'package:memorizegame/globals.dart' as globals;

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

  void compare(String data) {
    if (data == globals.qn.toString()) {
      globals.lvl++;
      Navigator.popAndPushNamed(context, '/gamestart');
    }
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    Timer _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            _start = 5;
            timer.cancel();
            compare(myController.text);
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

  final myController = TextEditingController();
  void KeyPressHandler(event) {
    print(event);
    var data = event.data;
    if (data.code == 'ENTER') {
      compare(myController.text);
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
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
              child: RawKeyboardListener(
                focusNode: FocusNode(),
                onKey: KeyPressHandler,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: myController,
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
          ),
        ],
      ),
    );
  }
}

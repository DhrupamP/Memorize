// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:memorizegame/Styles/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff072540),
      body: Stack(
        children: const [
          Align(
            alignment: Alignment(0, -0.5),
            child: Text(
              'Memorize!!',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.5),
            child: Text(
              'Click Anywhere to Start',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

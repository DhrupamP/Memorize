// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:memorizegame/Styles/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGround,
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}

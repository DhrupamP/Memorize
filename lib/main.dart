// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'Comps/Home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: Color(0xff072540)),
      home: Home(),
    );
  }
}

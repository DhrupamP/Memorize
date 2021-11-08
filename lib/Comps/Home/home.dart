// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memorizegame/Styles/constants.dart';
import 'package:blinking_text/blinking_text.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/gamestart');
      },
      child: Scaffold(
        backgroundColor: Color(0xff072540),
        body: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.5),
              child: Text(
                'Memorize!!',
                style:
                    GoogleFonts.pressStart2p(fontSize: 30, color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.5),
              child: BlinkText(
                'Click Anywhere\n\nto Start',
                textAlign: TextAlign.center,
                style: GoogleFonts.pressStart2p(
                  fontSize: 20,
                  color: kPink,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memorizegame/Styles/constants.dart';
import 'package:memorizegame/globals.dart' as globals;

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var bestlvl = globals.bestlvl;
  var currlvl = globals.lvl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        globals.lvl = 1;
        Navigator.popAndPushNamed(context, '/gamestart');
      },
      child: Scaffold(
        backgroundColor: kBackGround,
        body: Stack(
          children: [
            Align(
              alignment: Alignment(0.0, -0.7),
              child: Container(
                child: Text(
                  'GAME OVER!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.pressStart2p(
                    fontSize: 50,
                    color: kPink,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.2),
              child: Container(
                child: Text(
                  'Highest level \n \n$bestlvl',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.pressStart2p(
                      fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0, -0.2),
              child: Container(
                child: Text(
                  'Current level \n \n$currlvl',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.pressStart2p(
                      fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.8),
              child: Container(
                child: BlinkText(
                  'Tap anywhere\n\nto restart!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.pressStart2p(
                    fontSize: 20,
                    color: kPink,
                    letterSpacing: -1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

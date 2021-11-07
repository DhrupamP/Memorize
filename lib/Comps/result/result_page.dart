import 'package:flutter/material.dart';
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
        globals.lvl = 0;
        Navigator.popAndPushNamed(context, '/gamestart');
      },
      child: Scaffold(
        backgroundColor: kBackGround,
        body: Stack(
          children: [
            Align(
              alignment: Alignment(0.5, -0.4),
              child: Container(
                child: Text('highest level \n $bestlvl'),
              ),
            ),
            Align(
              alignment: Alignment(-0.5, -0.4),
              child: Container(
                child: Text('current level \n $currlvl'),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.4),
              child: Container(
                child: Text('Tap anywhere to restart!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

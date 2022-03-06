// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'game_screen.dart';


class WelcomeScreen extends StatefulWidget {
  // const WelcomeScreen({Key? key}) : super(key: key);
  static String id = 'welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(width: 100.0, height: 100.0),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      Navigator.pushNamed(context, GameScreen.id);
                    });
                  },
                  child: Text('Play'),
                  ),
                const SizedBox(width: 20.0, height: 100.0),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'Horizon',
                    color: Colors.deepOrange
                  ),
                  child: AnimatedTextKit(
                      animatedTexts: [
                        RotateAnimatedText('TIC'),
                        RotateAnimatedText('TAC'),
                        RotateAnimatedText('TOE'),
                      ]
                  ),
                ),


              ],
            ),
          ],
        ),
      )
    );
  }
}



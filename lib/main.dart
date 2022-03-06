import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe_3d/game_screen.dart';
import 'package:tictactoe_3d/welcome_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        GameScreen.id : (context) => GameScreen(),
      },
    );
  }
}



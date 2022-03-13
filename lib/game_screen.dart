import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:math';
import 'package:tictactoe_3d/player.dart';
import 'package:tictactoe_3d/game.dart';


List<Color> gameBackgrounds = [Colors.teal, Colors.orange, Colors.lightGreen];
Color backColor = gameBackgrounds[Random().nextInt(gameBackgrounds.length)];
Player _player1 = Player();
Player _player2 = Player();
Game _game = Game();

class GameScreen extends StatefulWidget {

  static String id = 'game screen';

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  winnerMessage(){
    backColor = gameBackgrounds[Random().nextInt(gameBackgrounds.length)];
    return Alert(
      context: context,
      type: AlertType.success,
      title: "Game Over",
      desc: _game.winner.toString(),
      buttons: [
        DialogButton(
          child: const Text(
            "Restart",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: (){
            _game.restart();
            setState(() {
              Navigator.pop(context);
            });

          },

          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();

  }

  Color oColor = Colors.white;
  Color xColor = Colors.white24;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(20.0),
          color: backColor,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: const Text("Tic Tac Toe", style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontFamily: 'RockSalt'
                  ),
                    textAlign: TextAlign.center,),
                ),
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                  // padding: EdgeInsets.all(20.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  // itemCount: gridList.length,
                  itemCount: _game.state.length,
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onTap: (){
                        // updateBox(index);
                        _game.updateState(index);
                        if(_game.isOver){
                          winnerMessage();
                          _game.restart();
                        }
                        setState(() {
                        });
                      },
                      child: Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            // color: gridColor[index],
                            color: _game.gridColor[index],
                          ),
                          child: Center(
                            child: Text(_game.state[index], style: const TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),),
                          )
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          // color: Colors.white60,
                          padding: EdgeInsets.all(20.0),
                          margin: EdgeInsets.all(20.0),
                          color: Colors.redAccent,
                          child: Text("o", style: TextStyle(
                              fontSize: 50.0,
                              color: _game.turn == 1 ? Colors.white: Colors.white12,
                              fontWeight: FontWeight.w700,
                              // fontFamily: 'RockSalt',
                          ), textAlign: TextAlign.center,),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // color: Colors.white60,
                          padding: EdgeInsets.all(20.0),
                          margin: EdgeInsets.all(20.0),
                          color: Colors.blueAccent,
                          child: Text("x", style: TextStyle(
                              fontSize: 50.0,
                              color: _game.turn == 1 ? Colors.white12: Colors.white,
                              fontWeight: FontWeight.w700,
                              // fontFamily: 'RockSalt',
                          ), textAlign: TextAlign.center,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          )
      ),
    );
  }
}

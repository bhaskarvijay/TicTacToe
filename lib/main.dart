import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:math';
List<Color> gameBackgrounds = [Colors.teal, Colors.orange, Colors.lightGreen];
Color backColor = gameBackgrounds[Random().nextInt(gameBackgrounds.length)];
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void updateBox(int index){
    if (gridList[index] == ""){
      setState((){
        if(isOTurn){
          gridList[index] = "o";
          gridColor[index] = Colors.redAccent;
          isOTurn = false;
        }else{
          gridList[index] = "x";
          gridColor[index] = Colors.blueAccent;
          isOTurn = true;
        }

      });
      checkWinner();
    }

  }
  void checkWinner(){
    if(gridList[0] == gridList[1] && gridList[1] == gridList[2] && gridList[0] != ""){
      if(gridList[0] == "o"){
        winner = "Player 1";
      }else{
        winner = "Player2";
      }
      winnerMessage(winner);
      // isGameOver = true;
    }
    else if(gridList[3] == gridList[4] && gridList[4] == gridList[5] && gridList[3] != ""){
      if(gridList[3] == "o"){
        winner = "Player 1";
      }else{
        winner = "Player2";
      }

      winnerMessage(winner);
      // isGameOver = true;
    }
    else if(gridList[6] == gridList[7] && gridList[7] == gridList[8] && gridList[6] != ""){
      if(gridList[6] == "o"){
        winner = "Player 1";
      }else{
        winner = "Player2";
      }
      winnerMessage(winner);
    }
    else if(gridList[0] == gridList[3] && gridList[3] == gridList[6] && gridList[0] != ""){
      if(gridList[0] == "o"){
        winner = "Player 1";
      }else{
        winner = "Player2";
      }
      winnerMessage(winner);
    }
    else if(gridList[1] == gridList[4] && gridList[4] == gridList[7] && gridList[1] != ""){
      if(gridList[1] == "o"){
        winner = "Player 1";
      }else{
        winner = "Player2";
      }
      winnerMessage(winner);
    }
    else if(gridList[2] == gridList[5] && gridList[5] == gridList[8] && gridList[2] != ""){
      if(gridList[2] == "o"){
        winner = "Player 1";
      }else{
        winner = "Player2";
      }
      winnerMessage(winner);
    }
    else if(gridList[0] == gridList[4] && gridList[4] == gridList[8] && gridList[0] != ""){
      if(gridList[0] == "o"){
        winner = "Player 1";
      }else{
        winner = "Player2";
      }
      winnerMessage(winner);
    }
    else if(gridList[2] == gridList[4] && gridList[4] == gridList[6] && gridList[2] != ""){
      if(gridList[2] == "o"){
        winner = "Player 1 won The Game";
      }else{
        winner = "Player2 won The Game";
      }
      winnerMessage(winner);
    }
    else if(gridList.contains("") != true){
      winner = "Game Drawn";
      winnerMessage(winner);
    }
  }
  winnerMessage(winner){
    isGameOver = true;
    return Alert(
      context: context,
      type: AlertType.success,
      title: "Game Over",
      desc: winner,
      buttons: [
        DialogButton(
          child: Text(
            "Restart",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: (){
            setState(() {
              gridList = ["", "", "", "","", "", "", "", "",];
              gridColor = [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white,];
              isGameOver = false;
              isOTurn = true;
              winner = null;
              backColor = gameBackgrounds[Random().nextInt(gameBackgrounds.length)];
              Navigator.pop(context);
            });

          },

          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();

  }

  List<String> gridList = ["", "", "", "","", "", "", "", "",];
  List<Color> gridColor = [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white,];
  bool isGameOver = false;
  bool isOTurn = true;
  late String winner;
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
                  padding: EdgeInsets.only(top: 30.0),
                  child: Text("Tic Tac Toe", style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                    textAlign: TextAlign.center,),
                ),
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                  padding: EdgeInsets.all(20.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: gridList.length,
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onTap: (){
                        updateBox(index);
                      },
                      child: Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 3.0, color: Colors.white),
                            borderRadius: BorderRadius.circular(30.0),
                            color: gridColor[index],
                            // color: gridList[index] == 'x' ? Colors.yellow :
                          ),
                          child: Center(
                            child: Text(gridList[index], style: TextStyle(
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
                              color: isOTurn ? Colors.white: Colors.white12,
                              fontWeight: FontWeight.w700
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
                              color: isOTurn ? Colors.white12: Colors.white,
                              fontWeight: FontWeight.w700
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



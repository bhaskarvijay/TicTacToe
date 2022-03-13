import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tictactoe_3d/player.dart';


class Game{
  bool isOver = false;
  List<String> state = ["", "", "", "","", "", "", "", "",];
  List<Color> gridColor = [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white,];
  int turn = 1;
  int winner = 0;

  void restart(){
    print('restarting......');
    isOver = false;
    state = ["", "", "", "","", "", "", "", "",];
    gridColor = [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white, Colors.white,];
    turn = 1;
    winner = 0;
  }
  void checkWinner(){
    if(state[0] == state[1] && state[1] == state[2] && state[0] != ""){
      winner = turn;
      isOver = true;
    }
    else if(state[3] == state[4] && state[4] == state[5] && state[3] != ""){
      winner = turn;
      isOver = true;
    }
    else if(state[6] == state[7] && state[7] == state[8] && state[6] != ""){
      winner = turn;
      isOver = true;
    }
    else if(state[0] == state[3] && state[3] == state[6] && state[0] != ""){
      winner = turn;
      isOver = true;
    }
    else if(state[1] == state[4] && state[4] == state[7] && state[1] != ""){
      winner = turn;
      isOver = true;
    }
    else if(state[2] == state[5] && state[5] == state[8] && state[2] != ""){
      winner = turn;
      isOver = true;
    }
    else if(state[0] == state[4] && state[4] == state[8] && state[0] != ""){
      winner = turn;
      isOver = true;
    }
    else if(state[2] == state[4] && state[4] == state[6] && state[2] != ""){
      winner = turn;
      isOver = true;
    }
    else if(state.contains("") != true){
      // winner = turn;
      winner = 0;
      isOver = true;
    }
    if(isOver == false){
      if(turn == 1){
        turn = 2;
      }else {
        turn = 1;
      }
    }
    print(winner);
    print(isOver);
    // if (winner != 0){
    //   isOver = true;
    // }
  }
  void updateState(int index){
    if (state[index] == ""){
      if(turn == 1){
        state[index] = "o";
        gridColor[index] = Colors.redAccent;
      }else{
        state[index] = "x";
        gridColor[index] = Colors.blueAccent;
      }
      checkWinner();
    }
  }
}
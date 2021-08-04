/*
Creates the game board with blocks
 */
import 'package:flutter/material.dart';

import 'package:tictactoe/block.dart';

class Board {
  final List<Block> board = new List(9);
  int score_1;
  int score_2;

  Board() {
    // Create a 3 by 3 blocks board
    for (int i = 0; i < 9; i++) {
      board[i] = new Block();
      score_1 = 0;
      score_2 = 0;
    }
  }

  void reset() {
    // Create a 3 by 3 blocks board
    for (int i = 0; i < 9; i++) {
      this.board[i].state = 0;
      this.board[i].image = 'blank.png';
      if (board[i].color != null) {
        this.board[i].color = Colors.grey;
      }
    }
  }
}

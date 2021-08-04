/*
Checks whether the board is filled or a player had won
 */

import 'package:tictactoe/board.dart';

class CheckGame {
  List<int> check(Board board) {
    // Check horizontal
    for (int i = 0; i < 9; i += 3) {
      if (board.board[i].state == 0) {
        continue;
      }

      if (board.board[i].state == board.board[i + 1].state &&
          board.board[i].state == board.board[i + 2].state) {
        return [i, i + 1, i + 2];
      }
    }
    // Check vertical
    for (int i = 0; i < 3; i++) {
      if (board.board[i].state == 0) {
        continue;
      }
      if (board.board[i].state == board.board[i + 3].state &&
          board.board[i].state == board.board[i + 6].state) {
        return [i, i + 3, i + 6];
      }
    }
    // Checks diagonal
    if (board.board[4].state != 0) {
      if (board.board[0].state == board.board[4].state &&
          board.board[0].state == board.board[8].state) {
        return [0, 4, 8];
      } else if (board.board[2].state == board.board[4].state &&
          board.board[2].state == board.board[6].state) {
        return [2, 4, 6];
      }
    }
    return null;
  }
}

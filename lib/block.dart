/*
This file defines the class Block
 */

import 'package:flutter/material.dart';

class Block {
  int state;
  String image;
  MaterialColor color;

  Block() {
    // State defines the block is taken by which player
    // 0 for neither players
    // 1 for player 1
    // 2 for player 2
    this.state = 0;
    this.image = 'blank.png';
    this.color = Colors.grey;
  }

  void setState(int newState) {
    this.state = newState;
    this.image = (newState == 1) ? 'cross.png' : 'circle.png';
  }
}

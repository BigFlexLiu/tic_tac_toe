import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tictactoe/CheckGame.dart';
import 'package:tictactoe/board.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Board board = new Board();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Game(),
    );
  }
}

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  Board board = new Board();
  // Use integers 1 and 2 to represent players
  int player = 1;
  CheckGame checker = new CheckGame();
  bool gameOver = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {
                setState(() {
                  board.reset();
                  player = 1;
                  gameOver = false;
                });
              },
              icon: Icon(Icons.settings_backup_restore),
            ),
          ],
          title: Text('Tic Tac Toe'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: List.generate(9, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: board.board[index].color,
                    ),
                    child: OutlineButton(
                        onPressed: () {
                          setState(() {
                            if (!gameOver) {
                              if (board.board[index].state == 0) {
                                player = player == 1 ? 2 : 1;
                                board.board[index].setState(player);

                                List<int> row = checker.check(board);
                                if (row != null) {
                                  for (int i = 0; i < 3; i++) {
                                    board.board[row[i]].color = Colors.orange;
                                  }
                                  gameOver = true;
                                  if (player == 1) {
                                    board.score_2 += 1;
                                  } else {
                                    board.score_1 += 1;
                                  }
                                }
                              }
                            }
                          });
                        },
                        child: Image(
                          image: AssetImage(
                            'assets/${board.board[index].image}',
                          ),
                        ),
                        color: Colors.deepPurple,
                        padding: EdgeInsets.all(20)),
                  );
                })),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 40.0, 40, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: null,
                    onBackgroundImageError: null,
                    backgroundColor: Colors.blue[700],
                    child: Text(
                      '${board.score_1}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    radius: 30,
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    color: Colors.blue[700],
                    child: Center(
                        child: Text(
                      '${board.score_2}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

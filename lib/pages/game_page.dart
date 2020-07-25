import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_game_app/viewmodels/gameViewModel.dart';

class GamePage extends StatelessWidget {
  final GameViewModel game;

  GamePage({this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.name),
      ),
      body: Column(
        children: [
           Text(
             game.name,
             style: TextStyle(fontSize: 23,color: Color.fromRGBO(125, 166, 125, 1)),
              ),
          Text(
            game.deck
          ),
          Image(
            image: NetworkImage(game.image["medium_url"].toString())
          )
        ],
      ),
    );
  }
}
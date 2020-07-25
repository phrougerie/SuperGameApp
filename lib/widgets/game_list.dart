import 'package:flutter/material.dart';
import 'package:super_game_app/viewmodels/gameViewModel.dart';


class GameList extends StatelessWidget {

  final List<GameViewModel> games;

  GameList({this.games});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.games.length,
      itemBuilder: (context, index) {

        final game = this.games[index];

        return ListTile(
          leading: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(game.image["icon_url"].toString())
                ),
                borderRadius: BorderRadius.circular(6)
            ),
            width: 50,
            height: 100,
          ),
          contentPadding: EdgeInsets.all(10),
          title: Text(game.name),
        );
      },
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_game_app/viewmodels/display_view_model.dart';
import 'package:super_game_app/viewmodels/gameListViewmodel.dart';
import 'package:super_game_app/viewmodels/gameViewModel.dart';

class GamePage extends StatelessWidget {
  final GameViewModel game;

  GamePage({this.game});

  @override
  Widget build(BuildContext context) {

    return  ChangeNotifierProvider<DisplayGameViewModel>(
        create: (context) => DisplayGameViewModel(game),
        child: Scaffold(
          appBar: AppBar(
            title: Text(game.name),
          ),
          body:
          Consumer<DisplayGameViewModel>(
          builder: (context,vm, child){
            return Column(
              children: [
                Text(
                  vm.game.name,
                  style: TextStyle(fontSize: 23,color: Color.fromRGBO(125, 166, 125, 1)),
                ),
                Text(
                    vm.game.deck
                ),
                Image(
                    image: NetworkImage(vm.game.image["medium_url"].toString())
                )
              ],
            );
          }

        )
    )
    );
  }
}
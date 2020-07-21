import 'package:super_game_app/model/game.dart';

class GameViewModel {

  final Game game;

  GameViewModel({this.game});

  int get id{
    return this.game.id;
  }

  String get description {
    return this.game.description;
  }
}
import 'dart:collection';

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

  LinkedHashMap<String,dynamic> get  image{
    return this.game.image;
  }

  String get name {
    return this.game.name;
  }

  String get deck {
    return this.game.deck;
  }

}
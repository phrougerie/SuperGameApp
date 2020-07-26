import 'package:flutter/cupertino.dart';
import 'package:super_game_app/services/gameService.dart';
import 'package:super_game_app/viewmodels/gameViewModel.dart';

class GameListViewModel extends ChangeNotifier {
  List<GameViewModel> games = List<GameViewModel>();
  int page;
  bool visibilityBack = false;
  bool visibilityNext = false;

  void reinit(){
    visibilityNext = true;
    visibilityBack = false;
    page = 1;
  }

  Future<void> fetchGames(String search) async {
    final results = await GameService().fetchGames(search,page);
    this.games = results.map((item) => GameViewModel(game: item)).toList();
    notifyListeners();
  }
}
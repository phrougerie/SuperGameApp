import 'package:flutter/cupertino.dart';
import 'package:super_game_app/services/gameService.dart';
import 'package:super_game_app/viewmodels/gameViewModel.dart';

class GameListViewModel extends ChangeNotifier {
  List<GameViewModel> games = List<GameViewModel>();

  Future<void> fetchGames() async {
    final results = await GameService().fetchGames();
    this.games = results.map((item) => GameViewModel(game: item)).toList();
    print(this.games);
    notifyListeners();
  }
}
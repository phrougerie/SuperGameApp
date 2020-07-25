import 'package:flutter/cupertino.dart';
import 'package:super_game_app/services/gameService.dart';
import 'package:super_game_app/viewmodels/gameViewModel.dart';

class GameListViewModel extends ChangeNotifier {
  List<GameViewModel> games = List<GameViewModel>();

  Future<void> fetchGames(String search) async {
    final results = await GameService().fetchGames(search);
    this.games = results.map((item) => GameViewModel(game: item)).toList();
    notifyListeners();
  }
}
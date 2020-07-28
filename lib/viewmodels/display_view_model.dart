import 'package:flutter/cupertino.dart';

import 'gameViewModel.dart';

class DisplayGameViewModel extends ChangeNotifier {
  final GameViewModel game;

  DisplayGameViewModel(this.game);
}
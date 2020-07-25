import 'package:http/http.dart' as http;
import 'package:super_game_app/model/game.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';


class GameService {

  Future<List<Game>> fetchGames(String search) async {
    final url = "https://www.giantbomb.com/api/search/?api_key=10890e83929ff4cdef85907f1812fc2e8814604d&format=json&query="+search;
    final response = await http.get(
      url
    );
    final responseJson = jsonDecode(response.body);
    final Iterable json = responseJson["results"];
    return json.map((game) => Game.fromJson(game)).toList();
  }

}
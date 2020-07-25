

import 'dart:collection';

import 'package:html/parser.dart';
import 'dart:convert';


class Game {
  final int id;
  final String description;
  final String name;
  final LinkedHashMap<String,dynamic> image;
  final String deck;

  Game({this.id, this.description, this.image, this.name,this.deck});

  factory Game.fromJson(Map<String, dynamic> json){
    return Game(
      id: json["id"],
      description: json["description"],
      image: json["image"],
      name: json["name"],
      deck: json["deck"]
    );
  }

}
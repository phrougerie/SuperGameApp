class Game {
  final int id;
  final String description;

  Game({this.id,this.description});

  factory Game.fromJson(Map<String, dynamic> json){
    return Game(
      id: json["id"],
      description: json["description"]
    );
  }

}
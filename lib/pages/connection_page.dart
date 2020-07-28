import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_game_app/pages/game_lispage.dart';

class ConnectionPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Connection"),
      ),
      body: Column(
        children: [
          Text(
            "Veuillez appuyer pour vous connecter"
          ),
          FlatButton(
            child: Text(
                "Connexion"
            ),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> GameListPage())
              );
            },

          ),

        ],
      ),
    );
  }
}
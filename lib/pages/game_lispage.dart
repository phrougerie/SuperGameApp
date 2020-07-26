import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_game_app/viewmodels/gameListViewmodel.dart';
import 'package:super_game_app/widgets/game_list.dart';
import 'package:super_game_app/widgets/main_bottom.dart';
class GameListPage extends StatefulWidget{
  @override
  _GameListPageState createState() => _GameListPageState();
}

class _GameListPageState extends State<GameListPage> {

  final TextEditingController _controller = TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){

    final vm = Provider.of<GameListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Games"),
      ),
        body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    if(value.isNotEmpty) {
                      vm.reinit();
                      vm.fetchGames(value);
                      _controller.clear();
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none
                  ),

                ),
              ),

              Expanded(
                  child: GameList(games: vm.games)),
              Container(
                child: Row(
                  children: <Widget>[
                    if(vm.visibilityBack) IconButton(
                      icon: Icon(Icons.volume_up),
                      tooltip: 'Increase volume by 10',
                      onPressed: () {

                      },
                    ),
                    if(vm.visibilityNext) IconButton(
                      icon: Icon(Icons.volume_up),
                      tooltip: 'Increase volume by 10',
                      onPressed: () {

                      },
                    ),

                  ],
                ),
              ),
              Container(
                  height: 100,
                child: BottomBarWidget(),
              )
            ])
        )

    );
  }
}

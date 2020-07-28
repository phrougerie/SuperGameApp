import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:super_game_app/viewmodels/gameListViewmodel.dart';

import 'game_list.dart';
import 'main_bottom.dart';

class GameListDisplay extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context){

    final vm = Provider.of<GameListViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Games"),
        ),
        body:

        Container(
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
                      icon: Icon(Icons.arrow_back),
                      tooltip: 'Previous page',
                      onPressed: () {
                        vm.page--;
                        if(vm.page==1) vm.visibilityBack = false;
                        vm.fetchGames(vm.currentSearch);
                      },
                    ),
                    if(vm.visibilityNext) IconButton(
                      icon: Icon(Icons.arrow_forward),
                      tooltip: 'Next page',
                      onPressed: () {
                        vm.page++;
                        vm.visibilityBack=true;
                        vm.fetchGames(vm.currentSearch);

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

class _controller {
}


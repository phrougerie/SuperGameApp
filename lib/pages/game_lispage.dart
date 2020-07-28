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




    return ChangeNotifierProvider<GameListViewModel>(
      create: (context) => GameListViewModel(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Games"),
          ),
          body:
          Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Consumer<GameListViewModel>(
                builder: (context,vm, child){
                  return Container(
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
                  );

                }
              )
          ),
      )
    );
  }
}

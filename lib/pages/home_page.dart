import 'dart:async';

import 'package:eshop_crawler_app/pages/game_filter_page.dart';
import 'package:eshop_crawler_app/pages/game_page.dart';
import 'package:eshop_crawler_app/redux/state.dart';
import 'package:eshop_crawler_app/view_models/game_filter_vm.dart';
import 'package:eshop_crawler_app/view_models/games_vm.dart';
import 'package:eshop_crawler_app/widgets/game_card.dart';
import 'package:eshop_crawler_app/widgets/slide_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class _HomeViewModel {
  final GameFilterViewModel gameFilter;
  final GamesViewModel games;

  _HomeViewModel({
    @required this.gameFilter,
    @required this.games,
  });

  static fromStore(Store<RootState> store) {
    return _HomeViewModel(
      gameFilter: GameFilterViewModel.fromStore(store),
      games: GamesViewModel.fromStore(store),
    );
  }
}

class HomePage extends StatefulWidget {
  static final route = '/';

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _listController = ScrollController();
  Timer _timer;

  _scrollListener(_HomeViewModel vm) {
    return () {
      print(_listController.position.extentAfter);
      final isLoading = vm.games.isLoading();
      final hasMore = vm.games.hasMore();
      if (_listController.position.extentAfter < 5000 &&
          !isLoading &&
          hasMore) {
        vm.games.onFetchGames();
      }
    };
  }

  updateView(_HomeViewModel vm) {
    this._searchController.text = vm.gameFilter.getSearch();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootState, _HomeViewModel>(
      converter: (Store<RootState> store) {
        return _HomeViewModel.fromStore(store);
      },
      onInitialBuild: (_HomeViewModel vm) {
        _listController.addListener(_scrollListener(vm));
        this.updateView(vm);
      },
      onDispose: (_) {
        _listController.dispose();
      },
      builder: (BuildContext context, _HomeViewModel vm) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: CupertinoTextField(
              clearButtonMode: OverlayVisibilityMode.editing,
              controller: _searchController,
              placeholder: 'Zelda, Mario, etc.',
              onChanged: (String value) {
                vm.gameFilter.onChangeSearch(value);

                if (_timer != null) {
                  _timer.cancel();
                }

                this.setState(() {
                  _timer = new Timer(const Duration(seconds: 1), () {
                    vm.games.onFetchGames(reset: true);
                  });
                });
              },
            ),
            trailing: Padding(
              padding: EdgeInsets.only(left: 10),
              child: CupertinoButton(
                padding: EdgeInsets.all(0),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    SlideRoute(page: GameFilterPage()),
                  );
                  this.updateView(vm);
                  vm.games.onFetchGames(reset: true);
                },
                child: Text('Filter'),
              ),
            ),
          ),
          child: ListView(
            controller: _listController,
            children: vm.games.list.map<Widget>(
              (game) {
                return Container(
                  padding: EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => GamePage(game: game),
                        ),
                      );
                    },
                    child: GameCard(game: game),
                  ),
                );
              },
            ).toList()
              ..add(
                Visibility(
                  visible: vm.games.isLoading(),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: CupertinoActivityIndicator(),
                  ),
                ),
              ),
          ),
        );
      },
    );
  }
}

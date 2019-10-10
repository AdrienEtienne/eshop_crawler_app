import 'dart:async';

import 'package:eshop_crawler_app/pages/game_filter_page.dart';
import 'package:eshop_crawler_app/redux/game/selector.dart';
import 'package:eshop_crawler_app/redux/state.dart';
import 'package:eshop_crawler_app/view_models/game_filter_vm.dart';
import 'package:eshop_crawler_app/view_models/games_vm.dart';
import 'package:eshop_crawler_app/widgets/cupertino/cupertino_list_group.dart';
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
  Timer _timer;

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
        this.updateView(vm);
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
                  await Navigator.pushNamed(
                    context,
                    GameFilterPage.route,
                  );
                  this.updateView(vm);
                  vm.games.onFetchGames(reset: true);
                },
                child: Text('Filter'),
              ),
            ),
          ),
          child: Center(
            child: ListView(
              children: vm.games.list.map<Widget>(
                (game) {
                  final bestDiscount = vm.games.getBestDiscount(game);
                  final percent =
                      GameSelector.getPricePercentDiscount(bestDiscount);

                  return Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: <Widget>[
                        Visibility(
                          visible: game.euImageUrl != null,
                          child: Container(
                            decoration: new BoxDecoration(
                              image: new DecorationImage(
                                image: new NetworkImage(
                                  'https:${game.euImageUrl}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            constraints: BoxConstraints(
                              minWidth: double.infinity,
                              minHeight: 400,
                            ),
                          ),
                        ),
                        CupertinoListGroup(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    game.title,
                                    textAlign: TextAlign.center,
                                  ),
                                  Visibility(
                                    visible: bestDiscount.onSale,
                                    child: Text(
                                      '$percent% off',
                                      style: TextStyle(
                                        color: CupertinoColors.activeOrange,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Icon(CupertinoIcons.right_chevron),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList()
                ..add(
                  Visibility(
                    visible: vm.games.isLoading,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                ),
            ),
          ),
        );
      },
    );
  }
}

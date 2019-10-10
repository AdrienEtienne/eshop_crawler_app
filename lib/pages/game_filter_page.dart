import 'package:eshop_crawler_app/redux/state.dart';
import 'package:eshop_crawler_app/view_models/game_filter_vm.dart';
import 'package:eshop_crawler_app/widgets/cupertino/cupertino_list_group.dart';
import 'package:eshop_crawler_app/widgets/cupertino/cupertino_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class GameFilterPage<GameFilterViewModel> extends StatefulWidget {
  static final route = '/games/filter';

  @override
  State<StatefulWidget> createState() {
    return _GameFilterState();
  }
}

class _GameFilterState extends State<GameFilterPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootState, GameFilterViewModel>(
      converter: (Store<RootState> store) {
        return GameFilterViewModel.fromStore(store);
      },
      onInitialBuild: (GameFilterViewModel vm) {
        this._searchController.text = vm.getSearch();
      },
      builder: (BuildContext context, GameFilterViewModel vm) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            backgroundColor: CupertinoColors.white,
            border: Border(bottom: BorderSide.none),
            previousPageTitle: 'Games',
            middle: Text('Filter'),
          ),
          child: ListView(
            primary: false,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              CupertinoTitle(
                text: 'Search by name',
              ),
              CupertinoListGroup(
                child: CupertinoTextField(
                  clearButtonMode: OverlayVisibilityMode.editing,
                  controller: _searchController,
                  placeholder: 'Zelda, Mario, etc.',
                  onChanged: (String value) {
                    vm.onChangeSearch(value);
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CupertinoTitle(
                text: 'Only games on sale',
              ),
              CupertinoListGroup(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('On Sale'),
                    CupertinoSwitch(
                      onChanged: vm.onSetOnSale,
                      value: vm.onSale,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CupertinoTitle(
                text: 'Countries where the games are sold',
              ),
              CupertinoListGroup(
                child: Column(
                  children: vm.shops.map(
                    (shop) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(shop.country),
                          CupertinoSwitch(
                            onChanged: (bool value) {
                              vm.onSelectCountry(shop.code, value);
                            },
                            value: vm.isShopSelected(shop),
                          ),
                        ],
                      );
                    },
                  ).toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

import 'package:eshop_crawler_app/redux/state.dart';
import 'package:eshop_crawler_app/view_models/game_filter_vm.dart';
import 'package:flutter/cupertino.dart';
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
        this._searchController.text = vm.search;
      },
      builder: (BuildContext context, GameFilterViewModel vm) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            backgroundColor: CupertinoColors.white,
            border: Border(bottom: BorderSide.none),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context, vm);
              },
              child: Icon(CupertinoIcons.clear),
            ),
            middle: Text('Filter'),
          ),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: CupertinoTextField(
                  clearButtonMode: OverlayVisibilityMode.editing,
                  controller: _searchController,
                  placeholder: 'Zelda, Mario, etc.',
                  onChanged: vm.onChangeSearch,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

import 'package:eshop_crawler_app/pages/game_filter_page.dart';
import 'package:eshop_crawler_app/redux/state.dart';
import 'package:eshop_crawler_app/view_models/game_filter_vm.dart';
import 'package:eshop_crawler_app/widgets/slide_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomePage extends StatefulWidget {
  static final route = '/';

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
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
            middle: CupertinoTextField(
              clearButtonMode: OverlayVisibilityMode.editing,
              controller: _searchController,
              placeholder: 'Zelda, Mario, etc.',
              onChanged: vm.onChangeSearch,
            ),
            trailing: Padding(
              padding: EdgeInsets.only(left: 10),
              child: CupertinoButton(
                padding: EdgeInsets.all(0),
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    SlideRoute(page: GameFilterPage()),
                  );
                  this.setState(() {
                    this._searchController.text =
                        (result as GameFilterViewModel).search;
                  });
                },
                child: Text('Filter'),
              ),
            ),
          ),
          child: Center(
            child: ListView(
              children: <Widget>[],
            ),
          ),
        );
      },
    );
  }
}

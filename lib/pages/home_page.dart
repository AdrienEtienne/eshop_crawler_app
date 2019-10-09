import 'package:eshop_crawler_app/redux/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class _HomeViewModel {
  _HomeViewModel();

  static fromStore(Store<RootState> store) {
    return _HomeViewModel();
  }
}

class HomePage extends StatelessWidget {
  static final route = '/';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootState, _HomeViewModel>(
      converter: (Store<RootState> store) {
        return _HomeViewModel.fromStore(store);
      },
      builder: (BuildContext context, _HomeViewModel vm) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(
              'Switch Prices',
            ),
            trailing: CupertinoButton(
              padding: EdgeInsets.all(0),
              onPressed: null,
              child: Icon(CupertinoIcons.add),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

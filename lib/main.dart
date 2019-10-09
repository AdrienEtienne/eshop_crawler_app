import 'package:eshop_crawler_app/pages/home_page.dart';
import 'package:eshop_crawler_app/redux/middleware.dart';
import 'package:eshop_crawler_app/redux/reducer.dart';
import 'package:eshop_crawler_app/redux/shop/action.dart';
import 'package:eshop_crawler_app/redux/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Store<RootState> store;

  MyApp()
      : store = Store<RootState>(
          reducer,
          initialState: RootState.initial(),
          middleware: createStoreMiddleware(),
        ) {
    fetchShops(store);
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<RootState>(
      store: this.store,
      child: CupertinoApp(
        title: 'Switch Prices',
        theme: CupertinoThemeData(
          primaryColor: CupertinoColors.destructiveRed,
        ),
        initialRoute: HomePage.route,
        routes: {
          HomePage.route: (context) => HomePage(),
        },
      ),
    );
  }
}

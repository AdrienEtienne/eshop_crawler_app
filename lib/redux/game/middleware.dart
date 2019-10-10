import 'package:eshop_crawler_app/data/keys.dart';
import 'package:eshop_crawler_app/redux/game/action.dart';
import 'package:eshop_crawler_app/redux/state.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Middleware<RootState>> gameMiddleware() {
  return [
    TypedMiddleware<RootState, SetSearchGameFilterAction>(_storeSearch()),
  ];
}

Middleware<RootState> _storeSearch() {
  return (Store<RootState> store, a, NextDispatcher next) async {
    final action = a as SetSearchGameFilterAction;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(StoringKeys.gameSearch, action.search);
    next(action);
  };
}

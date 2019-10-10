import 'package:eshop_crawler_app/data/keys.dart';
import 'package:eshop_crawler_app/redux/app/selector.dart';
import 'package:eshop_crawler_app/redux/app/state.dart';
import 'package:eshop_crawler_app/redux/game/action.dart';
import 'package:eshop_crawler_app/redux/state.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Middleware<RootState>> gameMiddleware() {
  return [
    TypedMiddleware<RootState, SetSearchAction>(_storeSearch()),
    TypedMiddleware<RootState, SelectShopAction>(_storeCountries()),
    TypedMiddleware<RootState, SetOnSaleAction>(_storeOnSale()),
  ];
}

Middleware<RootState> _storeSearch() {
  return (Store<RootState> store, a, NextDispatcher next) {
    final action = a as SetSearchAction;
    if (!AppSelector.isActionLoading(
      store.state.app.actions,
      ActionName.loadStoredData,
    )) {
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString(StoringKeys.gameSearch, action.search);
      });
    }
    next(action);
  };
}

Middleware<RootState> _storeCountries() {
  return (Store<RootState> store, a, NextDispatcher next) {
    final action = a as SelectShopAction;

    if (!AppSelector.isActionLoading(
      store.state.app.actions,
      ActionName.loadStoredData,
    )) {
      SharedPreferences.getInstance().then((prefs) {
        final currentList = List<String>.from(store.state.game.filterCountries);
        if (action.selected) {
          currentList.add(action.code);
        } else {
          currentList.remove(action.code);
        }
        prefs.setStringList(StoringKeys.gameCountries, currentList);
      });
    }
    next(action);
  };
}

Middleware<RootState> _storeOnSale() {
  return (Store<RootState> store, a, NextDispatcher next) {
    final action = a as SetOnSaleAction;
    if (!AppSelector.isActionLoading(
      store.state.app.actions,
      ActionName.loadStoredData,
    )) {
      SharedPreferences.getInstance().then((prefs) {
        prefs.setBool(StoringKeys.gameOnSale, action.onSale);
      });
    }
    next(action);
  };
}

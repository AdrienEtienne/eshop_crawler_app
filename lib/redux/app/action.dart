import 'dart:async';
import 'package:eshop_crawler_app/data/keys.dart';
import 'package:eshop_crawler_app/redux/app/state.dart';
import 'package:eshop_crawler_app/redux/game/action.dart';
import 'package:eshop_crawler_app/redux/state.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetActionRequestedAction {
  final ActionName name;
  SetActionRequestedAction(this.name);
}

class SetActionSucceededAction {
  final ActionName name;
  SetActionSucceededAction(this.name);
}

class SetActionFailedAction {
  final ActionName name;
  SetActionFailedAction(this.name);
}

Future<void> loadStoredData(Store<RootState> store) async {
  store.dispatch(SetActionRequestedAction(ActionName.loadStoredData));

  try {
    final prefs = await SharedPreferences.getInstance();

    final search = prefs.getString(StoringKeys.gameSearch) ?? '';
    store.dispatch(SetSearchGameFilterAction(search));

    store.dispatch(SetActionSucceededAction(ActionName.loadStoredData));
  } catch (e) {
    store.dispatch(SetActionFailedAction(ActionName.loadStoredData));
    throw e;
  }
}

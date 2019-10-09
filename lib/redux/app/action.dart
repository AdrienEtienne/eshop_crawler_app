import 'dart:async';
import 'package:eshop_crawler_app/redux/app/state.dart';
import 'package:redux/redux.dart';

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

Future<void> loadStoredData(Store<AppState> store) async {
  store.dispatch(SetActionRequestedAction(ActionName.loadStoredData));

  try {
    // final prefs = await SharedPreferences.getInstance();

    store.dispatch(SetActionSucceededAction(ActionName.loadStoredData));
  } catch (e) {
    store.dispatch(SetActionFailedAction(ActionName.loadStoredData));
    throw e;
  }
}

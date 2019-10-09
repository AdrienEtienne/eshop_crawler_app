import 'package:eshop_crawler_app/redux/app/action.dart';
import 'package:eshop_crawler_app/redux/app/state.dart';
import 'package:redux/redux.dart';

final Reducer<AppState> appReducer = combineReducers([
  TypedReducer<AppState, SetActionRequestedAction>(_setActionRequested),
  TypedReducer<AppState, SetActionSucceededAction>(_setActionSucceeded),
  TypedReducer<AppState, SetActionFailedAction>(_setActionFailed),
]);

AppState _setActionRequested(AppState state, SetActionRequestedAction action) {
  ActionState actionState = ActionState(name: action.name, isLoading: true);
  Map<String, ActionState> tmp = Map.from(state.actions);
  tmp.update(actionState.id, (el) => actionState, ifAbsent: () => actionState);
  return state.copyWith(
    actions: tmp,
  );
}

AppState _setActionSucceeded(AppState state, SetActionSucceededAction action) {
  ActionState actionState = ActionState(name: action.name);
  Map<String, ActionState> tmp = Map.from(state.actions);
  tmp.update(actionState.id, (el) => actionState, ifAbsent: () => actionState);
  return state.copyWith(
    actions: tmp,
  );
}

AppState _setActionFailed(AppState state, SetActionFailedAction action) {
  ActionState actionState = ActionState(
    name: action.name,
  );
  Map<String, ActionState> tmp = Map.from(state.actions);
  tmp.update(actionState.id, (el) => actionState, ifAbsent: () => actionState);
  return state.copyWith(
    actions: tmp,
  );
}

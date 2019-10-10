import 'package:eshop_crawler_app/redux/game/action.dart';
import 'package:eshop_crawler_app/redux/game/state.dart';
import 'package:redux/redux.dart';

final Reducer<GameState> gameReducer = combineReducers([
  TypedReducer<GameState, SetSearchGameFilterAction>(_setSearch),
]);

GameState _setSearch(GameState state, SetSearchGameFilterAction action) {
  return state.copyWith(filterSearch: action.search);
}

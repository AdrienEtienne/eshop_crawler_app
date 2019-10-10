import 'package:eshop_crawler_app/data/eshop_crawler/models/game.dart';
import 'package:eshop_crawler_app/data/eshop_crawler/models/request.dart';
import 'package:eshop_crawler_app/redux/game/action.dart';
import 'package:eshop_crawler_app/redux/game/state.dart';
import 'package:redux/redux.dart';

final Reducer<GameState> gameReducer = combineReducers([
  TypedReducer<GameState, SetSearchAction>(_setSearch),
  TypedReducer<GameState, SelectShopAction>(_selectShop),
  TypedReducer<GameState, SetOnSaleAction>(_setOnSale),
  TypedReducer<GameState, AddGamesAction>(_addGames),
  TypedReducer<GameState, ResetGamesAction>(_resetGames),
]);

GameState _setSearch(GameState state, SetSearchAction action) {
  return state.copyWith(filterSearch: action.search);
}

GameState _selectShop(GameState state, SelectShopAction action) {
  if (action.selected) {
    return state.copyWith(
      filterCountries: List.unmodifiable(
        List.from(state.filterCountries)..add(action.code),
      ),
    );
  } else {
    return state.copyWith(
      filterCountries: List.unmodifiable(
        List.from(state.filterCountries)..remove(action.code),
      ),
    );
  }
}

GameState _setOnSale(GameState state, SetOnSaleAction action) {
  return state.copyWith(filterOnSale: action.onSale);
}

GameState _addGames(GameState state, AddGamesAction action) {
  var list = List<GameDto>.from(state.list);
  list.addAll(action.list);
  return state.copyWith(
    list: list,
    page: action.page,
  );
}

GameState _resetGames(GameState state, ResetGamesAction action) {
  return state.copyWith(
    list: List<GameDto>(),
    page: MetadataPagination(
      current: 0,
      items: 0,
      itemsTotal: 0,
    ),
  );
}

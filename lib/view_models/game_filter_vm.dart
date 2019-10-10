import 'package:eshop_crawler_app/redux/game/action.dart';
import 'package:eshop_crawler_app/redux/state.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';

class GameFilterViewModel {
  final String search;
  final Function(String search) onChangeSearch;

  GameFilterViewModel({
    @required this.search,
    @required this.onChangeSearch,
  });

  static fromStore(Store<RootState> store) {
    return GameFilterViewModel(
      search: store.state.game.filterSearch,
      onChangeSearch: (String search) {
        store.dispatch(SetSearchGameFilterAction(search));
      },
    );
  }
}

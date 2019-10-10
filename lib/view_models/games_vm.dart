import 'package:eshop_crawler_app/data/eshop_crawler/models/game.dart';
import 'package:eshop_crawler_app/data/eshop_crawler/models/price.dart';
import 'package:eshop_crawler_app/redux/app/selector.dart';
import 'package:eshop_crawler_app/redux/app/state.dart';
import 'package:eshop_crawler_app/redux/game/action.dart';
import 'package:eshop_crawler_app/redux/game/selector.dart';
import 'package:eshop_crawler_app/redux/state.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';

class GamesViewModel {
  final List<GameDto> list;
  final bool isLoading;
  final PriceDto Function(GameDto game) getBestDiscount;
  final Future Function({bool reset}) onFetchGames;

  GamesViewModel({
    @required this.list,
    @required this.isLoading,
    @required this.getBestDiscount,
    @required this.onFetchGames,
  });

  static fromStore(Store<RootState> store) {
    return GamesViewModel(
      list: store.state.game.list,
      isLoading: AppSelector.isActionLoading(
        store.state.app.actions,
        ActionName.fetchGames,
      ),
      getBestDiscount: (game) {
        return GameSelector.getBetterDiscount(game.prices);
      },
      onFetchGames: ({reset}) async {
        fetchGames(store, reset: reset);
      },
    );
  }
}

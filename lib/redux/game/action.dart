import 'dart:async';

import 'package:eshop_crawler_app/data/eshop_crawler/client.dart';
import 'package:eshop_crawler_app/data/eshop_crawler/models/game.dart';
import 'package:eshop_crawler_app/data/eshop_crawler/models/request.dart';
import 'package:eshop_crawler_app/redux/app/action.dart';
import 'package:eshop_crawler_app/redux/app/state.dart';
import 'package:eshop_crawler_app/redux/state.dart';
import 'package:redux/redux.dart';

class SetSearchAction {
  final String search;
  SetSearchAction(this.search);
}

class SelectShopAction {
  final String code;
  final bool selected;
  SelectShopAction(this.code, this.selected);
}

class SetOnSaleAction {
  final bool onSale;
  SetOnSaleAction(this.onSale);
}

class AddGamesAction {
  final List<GameDto> list;
  final MetadataPagination page;
  AddGamesAction(this.list, this.page);
}

class ResetGamesAction {
  ResetGamesAction();
}

Future<void> fetchGames(Store<RootState> store, {reset = false}) async {
  store.dispatch(SetActionRequestedAction(ActionName.fetchGames));

  if (reset) {
    store.dispatch(ResetGamesAction());
  }

  try {
    final body = await EshopCrawlerClient().getGames(
      countries: store.state.game.filterCountries,
      page: store.state.game.page.current + 1,
      sales: store.state.game.filterOnSale,
      search: store.state.game.filterSearch,
    );
    store.dispatch(AddGamesAction(
      body.result,
      body?.meta?.pagination,
    ));
    store.dispatch(SetActionSucceededAction(ActionName.fetchGames));
  } catch (e) {
    store.dispatch(SetActionFailedAction(ActionName.fetchGames));
    throw e;
  }
}

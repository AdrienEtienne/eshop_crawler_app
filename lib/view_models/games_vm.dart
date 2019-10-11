import 'package:eshop_crawler_app/data/eshop_crawler/models/game.dart';
import 'package:eshop_crawler_app/data/eshop_crawler/models/price.dart';
import 'package:eshop_crawler_app/data/eshop_crawler/models/shop.dart';
import 'package:eshop_crawler_app/redux/app/selector.dart';
import 'package:eshop_crawler_app/redux/app/state.dart';
import 'package:eshop_crawler_app/redux/game/action.dart';
import 'package:eshop_crawler_app/redux/state.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';

class PriceShop {
  final ShopDto shop;
  final PriceDto price;
  PriceShop(this.shop, this.price);
}

class GamesViewModel {
  final List<GameDto> list;
  final bool isLoading;
  final List<PriceShop> Function(
    List<PriceDto> prices,
  ) getFilteredPriceShops;
  final Future Function({bool reset}) onFetchGames;

  GamesViewModel({
    @required this.list,
    @required this.isLoading,
    @required this.getFilteredPriceShops,
    @required this.onFetchGames,
  });

  static fromStore(Store<RootState> store) {
    return GamesViewModel(
      list: store.state.game.list,
      isLoading: AppSelector.isActionLoading(
        store.state.app.actions,
        ActionName.fetchGames,
      ),
      getFilteredPriceShops: (List<PriceDto> prices) {
        final results = List<PriceShop>();
        List<ShopDto> shops = store.state.shop.list;
        if (store.state.game.filterCountries.length > 0) {
          shops = store.state.shop.list.where((shop) {
            return store.state.game.filterCountries.contains(shop.code);
          }).toList();
        }
        shops.forEach((shop) {
          try {
            final price = prices.firstWhere((el) {
              return el.shopId == shop.id;
            });
            results.add(PriceShop(shop, price));
          } catch (e) {
            // Not foun
          }
        });
        return results;
      },
      onFetchGames: ({reset}) async {
        fetchGames(store, reset: reset);
      },
    );
  }
}

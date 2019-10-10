import 'package:eshop_crawler_app/data/eshop_crawler/models/shop.dart';
import 'package:eshop_crawler_app/redux/game/action.dart';
import 'package:eshop_crawler_app/redux/state.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';

class GameFilterViewModel {
  final String Function() getSearch;
  final bool onSale;
  final List<ShopDto> shops;
  final bool Function(ShopDto shop) isShopSelected;
  final Function(String search) onChangeSearch;
  final Function(String code, bool selected) onSelectCountry;
  final Function(bool selected) onSetOnSale;

  GameFilterViewModel({
    @required this.getSearch,
    @required this.onSale,
    @required this.shops,
    @required this.isShopSelected,
    @required this.onChangeSearch,
    @required this.onSelectCountry,
    @required this.onSetOnSale,
  });

  static fromStore(Store<RootState> store) {
    return GameFilterViewModel(
      getSearch: () => store.state.game.filterSearch,
      onSale: store.state.game.filterOnSale,
      shops: store.state.shop.list,
      isShopSelected: (ShopDto shop) {
        final selectedShops = store.state.shop.list.where(
            (shop) => store.state.game.filterCountries.contains(shop.code));
        return selectedShops.contains(shop);
      },
      onChangeSearch: (String search) {
        store.dispatch(SetSearchAction(search));
      },
      onSelectCountry: (String code, bool selected) {
        store.dispatch(SelectShopAction(code, selected));
      },
      onSetOnSale: (bool selected) {
        store.dispatch(SetOnSaleAction(selected));
      },
    );
  }
}

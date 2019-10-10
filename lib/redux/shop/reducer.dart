import 'package:eshop_crawler_app/redux/shop/action.dart';
import 'package:eshop_crawler_app/redux/shop/state.dart';
import 'package:redux/redux.dart';

final Reducer<ShopState> shopReducer = combineReducers([
  TypedReducer<ShopState, SetShopsAction>(_setShops),
]);

ShopState _setShops(ShopState state, SetShopsAction action) {
  action.shops.sort((shopA, shopB) {
    return shopA.country.toLowerCase().compareTo(shopB.country.toLowerCase());
  });

  return state.copyWith(list: action.shops);
}

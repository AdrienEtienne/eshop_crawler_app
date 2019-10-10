import 'package:eshop_crawler_app/redux/app/reducer.dart';
import 'package:eshop_crawler_app/redux/game/reducer.dart';
import 'package:eshop_crawler_app/redux/shop/reducer.dart';
import 'package:eshop_crawler_app/redux/state.dart';

RootState reducer(RootState state, action) {
  return RootState(
    app: appReducer(state.app, action),
    game: gameReducer(state.game, action),
    shop: shopReducer(state.shop, action),
  );
}

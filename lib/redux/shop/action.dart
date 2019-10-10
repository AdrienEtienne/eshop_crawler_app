import 'package:eshop_crawler_app/data/eshop_crawler/client.dart';
import 'package:eshop_crawler_app/data/eshop_crawler/models/shop.dart';
import 'package:eshop_crawler_app/redux/app/action.dart';
import 'package:eshop_crawler_app/redux/app/state.dart';
import 'package:eshop_crawler_app/redux/state.dart';
import 'package:redux/redux.dart';

class SetShopsAction {
  final List<ShopDto> shops;
  SetShopsAction(this.shops);
}

Future<void> fetchShops(Store<RootState> store) async {
  store.dispatch(SetActionRequestedAction(ActionName.fetchShops));

  try {
    final body = await EshopCrawlerClient().getShops();
    store.dispatch(SetShopsAction(body.result));
    store.dispatch(SetActionSucceededAction(ActionName.fetchShops));
  } catch (e) {
    store.dispatch(SetActionFailedAction(ActionName.fetchShops));
    throw e;
  }
}

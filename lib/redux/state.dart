import 'package:eshop_crawler_app/redux/app/state.dart';
import 'package:eshop_crawler_app/redux/shop/state.dart';

class RootState {
  final AppState app;
  final ShopState shop;

  RootState({
    this.app,
    this.shop,
  });

  RootState copyWith({
    AppState app,
    AppState shop,
  }) {
    return new RootState(
      app: app ?? this.app,
      shop: shop ?? this.shop,
    );
  }

  factory RootState.initial() {
    return RootState(
      app: AppState.initial(),
      shop: ShopState.initial(),
    );
  }
}

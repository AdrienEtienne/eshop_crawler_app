import 'package:eshop_crawler_app/redux/app/state.dart';
import 'package:eshop_crawler_app/redux/game/state.dart';
import 'package:eshop_crawler_app/redux/shop/state.dart';

class RootState {
  final AppState app;
  final GameState game;
  final ShopState shop;

  RootState({
    this.app,
    this.game,
    this.shop,
  });

  RootState copyWith({
    AppState app,
    GameState game,
    ShopState shop,
  }) {
    return new RootState(
      app: app ?? this.app,
      game: game ?? this.game,
      shop: shop ?? this.shop,
    );
  }

  factory RootState.initial() {
    return RootState(
      app: AppState.initial(),
      game: GameState.initial(),
      shop: ShopState.initial(),
    );
  }
}

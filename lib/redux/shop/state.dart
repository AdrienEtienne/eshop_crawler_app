import 'package:eshop_crawler_app/data/eshop_crawler/models/shop.dart';

class ShopState {
  final List<ShopDto> list;

  ShopState({
    this.list,
  });

  factory ShopState.initial() {
    return ShopState(
      list: List<ShopDto>(),
    );
  }

  ShopState copyWith({
    List<ShopDto> list,
  }) {
    return new ShopState(
      list: list ?? this.list,
    );
  }
}

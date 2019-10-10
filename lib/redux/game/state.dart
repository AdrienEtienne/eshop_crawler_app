import 'package:eshop_crawler_app/data/eshop_crawler/models/shop.dart';

class GameState {
  final List<String> filterCountries;
  final bool filterOnSale;
  final String filterSearch;

  GameState({
    this.filterCountries,
    this.filterOnSale,
    this.filterSearch,
  });

  factory GameState.initial() {
    return GameState(
      filterCountries: List<String>(),
      filterOnSale: false,
      filterSearch: '',
    );
  }

  GameState copyWith({
    List<ShopDto> filterCountries,
    bool filterOnSale,
    String filterSearch,
  }) {
    return new GameState(
      filterCountries: filterCountries ?? this.filterCountries,
      filterOnSale: filterOnSale ?? this.filterOnSale,
      filterSearch: filterSearch ?? this.filterSearch,
    );
  }
}

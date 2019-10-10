import 'package:eshop_crawler_app/data/eshop_crawler/models/game.dart';
import 'package:eshop_crawler_app/data/eshop_crawler/models/request.dart';

class GameState {
  final List<String> filterCountries;
  final bool filterOnSale;
  final String filterSearch;

  final List<GameDto> list;
  final MetadataPagination page;

  GameState({
    this.filterCountries,
    this.filterOnSale,
    this.filterSearch,
    this.list,
    this.page,
  });

  factory GameState.initial() {
    return GameState(
      filterCountries: List<String>(),
      filterOnSale: false,
      filterSearch: '',
      list: List<GameDto>(),
      page: MetadataPagination(
        current: 0,
        items: 0,
        itemsTotal: 0,
      ),
    );
  }

  GameState copyWith({
    List<String> filterCountries,
    bool filterOnSale,
    String filterSearch,
    List<GameDto> list,
    MetadataPagination page,
  }) {
    return new GameState(
      filterCountries: filterCountries ?? this.filterCountries,
      filterOnSale: filterOnSale ?? this.filterOnSale,
      filterSearch: filterSearch ?? this.filterSearch,
      list: list ?? this.list,
      page: page ?? this.page,
    );
  }
}

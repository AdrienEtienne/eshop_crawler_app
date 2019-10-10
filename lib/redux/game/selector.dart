import 'package:eshop_crawler_app/data/eshop_crawler/models/price.dart';

class GameSelector {
  static int getPricePercentDiscount(PriceDto price) {
    double result = 0;

    if (price != null && price.discountAmountValue != null) {
      result = 100 - (100 * price.discountAmountValue) / price.amountValue;
    }

    return result.round();
  }

  static PriceDto getBetterDiscount(
    List<PriceDto> prices,
  ) {
    PriceDto result = prices.first;
    int discount = 0;

    prices.forEach((price) {
      final tmp = GameSelector.getPricePercentDiscount(price);
      if (tmp > discount) {
        result = price;
        discount = tmp;
      }
    });

    return result;
  }
}

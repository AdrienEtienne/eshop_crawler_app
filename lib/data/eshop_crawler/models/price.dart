import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';

@JsonSerializable()
class PriceDto {
  @JsonKey()
  String id;
  @JsonKey()
  String createdAt;
  @JsonKey()
  String updatedAt;
  @JsonKey()
  String gameId;
  @JsonKey()
  String shopId;
  @JsonKey()
  String currency;
  @JsonKey()
  String amount;
  @JsonKey()
  double amountValue;
  @JsonKey()
  bool onSale;
  @JsonKey()
  String discountAmount;
  @JsonKey()
  double discountAmountValue;

  PriceDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.gameId,
    this.shopId,
    this.currency,
    this.amount,
    this.amountValue,
    this.onSale,
    this.discountAmount,
    this.discountAmountValue,
  });

  factory PriceDto.fromJson(Map<String, dynamic> json) {
    return _$PriceDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PriceDtoToJson(this);
  }
}

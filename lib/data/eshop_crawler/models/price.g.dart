// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceDto _$PriceDtoFromJson(Map<String, dynamic> json) {
  return PriceDto(
    id: json['id'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    gameId: json['gameId'] as String,
    shopId: json['shopId'] as String,
    currency: json['currency'] as String,
    amount: json['amount'] as String,
    amountValue: (json['amountValue'] as num)?.toDouble(),
    onSale: json['onSale'] as bool,
    discountAmount: json['discountAmount'] as String,
    discountAmountValue: (json['discountAmountValue'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PriceDtoToJson(PriceDto instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'gameId': instance.gameId,
      'shopId': instance.shopId,
      'currency': instance.currency,
      'amount': instance.amount,
      'amountValue': instance.amountValue,
      'onSale': instance.onSale,
      'discountAmount': instance.discountAmount,
      'discountAmountValue': instance.discountAmountValue,
    };

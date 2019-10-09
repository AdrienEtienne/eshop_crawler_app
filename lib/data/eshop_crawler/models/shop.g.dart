// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopDto _$ShopDtoFromJson(Map<String, dynamic> json) {
  return ShopDto(
    id: json['id'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    code: json['code'] as String,
    country: json['country'] as String,
    currency: json['currency'] as String,
    region: json['region'] as int,
  );
}

Map<String, dynamic> _$ShopDtoToJson(ShopDto instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'code': instance.code,
      'country': instance.country,
      'currency': instance.currency,
      'region': instance.region,
    };

ShopsResponse _$ShopsResponseFromJson(Map<String, dynamic> json) {
  return ShopsResponse(
    result: (json['result'] as List)
        ?.map((e) =>
            e == null ? null : ShopDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    statusCode: json['statusCode'] as num,
  );
}

Map<String, dynamic> _$ShopsResponseToJson(ShopsResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

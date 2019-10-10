// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessResponse _$SuccessResponseFromJson(Map<String, dynamic> json) {
  return SuccessResponse(
    statusCode: json['statusCode'] as num,
    meta: json['meta'] == null
        ? null
        : Metadata.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SuccessResponseToJson(SuccessResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'meta': instance.meta,
    };

MetadataPagination _$MetadataPaginationFromJson(Map<String, dynamic> json) {
  return MetadataPagination(
    current: json['current'] as num,
    items: json['items'] as num,
    itemsTotal: json['itemsTotal'] as num,
  );
}

Map<String, dynamic> _$MetadataPaginationToJson(MetadataPagination instance) =>
    <String, dynamic>{
      'current': instance.current,
      'items': instance.items,
      'itemsTotal': instance.itemsTotal,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) {
  return Metadata(
    pagination: json['pagination'] == null
        ? null
        : MetadataPagination.fromJson(
            json['pagination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'pagination': instance.pagination,
    };

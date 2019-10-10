// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameDto _$GameDtoFromJson(Map<String, dynamic> json) {
  return GameDto(
    id: json['id'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    title: json['title'] as String,
    titleSlug: json['titleSlug'] as String,
    euId: json['euId'] as String,
    americaId: json['americaId'] as String,
    jpId: json['jpId'] as String,
    description: json['description'] as String,
    descriptionShort: json['descriptionShort'] as String,
    euReleaseDate: json['euReleaseDate'] as String,
    americaReleaseDate: json['americaReleaseDate'] as String,
    jpReleaseDate: json['jpReleaseDate'] as String,
    euUrl: json['euUrl'] as String,
    euImageUrl: json['euImageUrl'] as String,
    americaUrl: json['americaUrl'] as String,
    japanUrl: json['japanUrl'] as String,
    prices: (json['prices'] as List)
        ?.map((e) =>
            e == null ? null : PriceDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GameDtoToJson(GameDto instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'title': instance.title,
      'titleSlug': instance.titleSlug,
      'euId': instance.euId,
      'americaId': instance.americaId,
      'jpId': instance.jpId,
      'description': instance.description,
      'descriptionShort': instance.descriptionShort,
      'euReleaseDate': instance.euReleaseDate,
      'americaReleaseDate': instance.americaReleaseDate,
      'jpReleaseDate': instance.jpReleaseDate,
      'euUrl': instance.euUrl,
      'euImageUrl': instance.euImageUrl,
      'americaUrl': instance.americaUrl,
      'japanUrl': instance.japanUrl,
      'prices': instance.prices,
    };

GamesResponse _$GamesResponseFromJson(Map<String, dynamic> json) {
  return GamesResponse(
    result: (json['result'] as List)
        ?.map((e) =>
            e == null ? null : GameDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    statusCode: json['statusCode'] as num,
  );
}

Map<String, dynamic> _$GamesResponseToJson(GamesResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'result': instance.result,
    };

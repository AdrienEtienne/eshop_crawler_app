import 'package:eshop_crawler_app/data/eshop_crawler/models/price.dart';
import 'package:eshop_crawler_app/data/eshop_crawler/models/request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable()
class GameDto {
  @JsonKey()
  String id;
  @JsonKey()
  String createdAt;
  @JsonKey()
  String updatedAt;
  @JsonKey()
  String title;
  @JsonKey()
  String titleSlug;
  @JsonKey()
  String euId;
  @JsonKey()
  String americaId;
  @JsonKey()
  String jpId;
  @JsonKey()
  String description;
  @JsonKey()
  String descriptionShort;
  @JsonKey()
  String euReleaseDate;
  @JsonKey()
  String americaReleaseDate;
  @JsonKey()
  String jpReleaseDate;
  @JsonKey()
  String euUrl;
  @JsonKey()
  String euImageUrl;
  @JsonKey()
  String americaUrl;
  @JsonKey()
  String japanUrl;
  @JsonKey()
  List<PriceDto> prices;

  GameDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.titleSlug,
    this.euId,
    this.americaId,
    this.jpId,
    this.description,
    this.descriptionShort,
    this.euReleaseDate,
    this.americaReleaseDate,
    this.jpReleaseDate,
    this.euUrl,
    this.euImageUrl,
    this.americaUrl,
    this.japanUrl,
    this.prices,
  });

  factory GameDto.fromJson(Map<String, dynamic> json) {
    return _$GameDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GameDtoToJson(this);
  }
}

@JsonSerializable()
class GamesResponse extends SuccessResponse {
  @JsonKey()
  List<GameDto> result;

  GamesResponse({this.result, num statusCode})
      : super(
          statusCode: statusCode,
        );
  factory GamesResponse.fromJson(Map<String, dynamic> json) {
    return _$GamesResponseFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$GamesResponseToJson(this);
  }
}

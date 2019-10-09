import 'package:eshop_crawler_app/data/eshop_crawler/models/request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop.g.dart';

@JsonSerializable()
class ShopDto {
  @JsonKey()
  String id;
  @JsonKey()
  String createdAt;
  @JsonKey()
  String updatedAt;
  @JsonKey()
  String code;
  @JsonKey()
  String country;
  @JsonKey()
  String currency;
  @JsonKey()
  int region;

  ShopDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.code,
    this.country,
    this.currency,
    this.region,
  });

  factory ShopDto.fromJson(Map<String, dynamic> json) {
    return _$ShopDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ShopDtoToJson(this);
  }
}

@JsonSerializable()
class ShopsResponse extends SuccessResponse {
  @JsonKey()
  List<ShopDto> result;

  ShopsResponse({this.result, num statusCode})
      : super(
          statusCode: statusCode,
        );
  factory ShopsResponse.fromJson(Map<String, dynamic> json) {
    return _$ShopsResponseFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ShopsResponseToJson(this);
  }
}

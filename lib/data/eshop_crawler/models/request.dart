import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable()
class SuccessResponse {
  @JsonKey()
  final num statusCode;
  @JsonKey()
  final Metadata meta;

  SuccessResponse({
    this.statusCode,
    this.meta,
  });
  factory SuccessResponse.fromJson(Map<String, dynamic> json) {
    return _$SuccessResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SuccessResponseToJson(this);
  }
}

@JsonSerializable()
class MetadataPagination {
  @JsonKey()
  final num current;
  @JsonKey()
  final num items;
  @JsonKey()
  final num itemsTotal;

  MetadataPagination({
    this.current,
    this.items,
    this.itemsTotal,
  });
  factory MetadataPagination.fromJson(Map<String, dynamic> json) {
    return _$MetadataPaginationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataPaginationToJson(this);
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey()
  final MetadataPagination pagination;

  Metadata({this.pagination});
  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataToJson(this);
  }
}

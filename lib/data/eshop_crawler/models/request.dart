import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable()
class SuccessResponse {
  @JsonKey()
  final num statusCode;

  SuccessResponse({this.statusCode});
  factory SuccessResponse.fromJson(Map<String, dynamic> json) {
    return _$SuccessResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SuccessResponseToJson(this);
  }
}

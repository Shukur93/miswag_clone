// To parse this JSON data, do
//
//     final OpenNotificationResponseModel = OpenNotificationResponseModelFromJson(jsonString);

import 'package:miswag_clone/core/models/common_api/common_api_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'open_notification_response_model.g.dart';

@JsonSerializable()
class OpenNotificationResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  @override
  int? statusCode;
  @JsonKey(name: "StatusDescription")
  @override
  @override
  String? statusDescription;

  OpenNotificationResponseModel({
    this.statusCode,
    this.statusDescription,
  });

  factory OpenNotificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OpenNotificationResponseModelFromJson(json);
}

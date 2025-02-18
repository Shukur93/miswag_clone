// To parse this JSON data, do
//
//     final OpenNotificationRequestModel = OpenNotificationRequestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'open_notification_request_model.g.dart';

@JsonSerializable()
class OpenNotificationRequestModel {
  @JsonKey(name: "NotificationId")
  int notificationId;

  OpenNotificationRequestModel({
    required this.notificationId,
  });

  Map<String, dynamic> toJson() => _$OpenNotificationRequestModelToJson(this);
}

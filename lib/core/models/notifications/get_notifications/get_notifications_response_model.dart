// To parse this JSON data, do
//
//     final getNotificationsResponseModel = getNotificationsResponseModelFromJson(jsonString);

import 'package:miswag_clone/core/models/common_api/common_api_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'get_notifications_response_model.g.dart';

GetNotificationsResponseModel getNotificationsResponseModelFromJson(
        String str) =>
    GetNotificationsResponseModel.fromJson(json.decode(str));

String getNotificationsResponseModelToJson(
        GetNotificationsResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetNotificationsResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  int? statusCode;

  @JsonKey(name: "StatusDescription")
  @override
  String? statusDescription;

  @JsonKey(name: "ResponseData")
  ResponseData? responseData;

  GetNotificationsResponseModel({
    this.statusCode,
    this.statusDescription,
    this.responseData,
  });

  factory GetNotificationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetNotificationsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetNotificationsResponseModelToJson(this);
}

@JsonSerializable()
class ResponseData {
  @JsonKey(name: "data")
  List<NotificationData> data;

  ResponseData({
    required this.data,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}

@JsonSerializable()
class NotificationData {
  @JsonKey(name: "ID")
  int? id;
  @JsonKey(name: "INSERT_DATE")
  String? insertDate;
  @JsonKey(name: "LAST_UPDATE")
  String? lastUpdate;
  @JsonKey(name: "TITTLE")
  String? tittle;
  @JsonKey(name: "BODY")
  String? body;
  @JsonKey(name: "ORDER_ID")
  int? orderId;
  @JsonKey(name: "IS_READED")
  bool? isReaded;
  @JsonKey(name: "IS_OPENED")
  bool? isOpened;
  @JsonKey(name: "ENTITY_ID")
  int? entityId;
  @JsonKey(name: "ENTITY_TYPE")
  String? entityType;

  NotificationData({
    this.id,
    this.insertDate,
    this.lastUpdate,
    this.tittle,
    this.body,
    this.orderId,
    this.isReaded,
    this.isOpened,
    this.entityId,
    this.entityType,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);
}

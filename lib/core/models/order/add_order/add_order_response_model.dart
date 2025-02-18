// To parse this JSON data, do
//
//     final addOrderResponseModel = addOrderResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:miswag_clone/core/models/common_api/common_api_response.dart';

part 'add_order_response_model.g.dart';

AddOrderResponseModel addOrderResponseModelFromJson(String str) =>
    AddOrderResponseModel.fromJson(json.decode(str));

String addOrderResponseModelToJson(AddOrderResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class AddOrderResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  int? statusCode;
  @JsonKey(name: "StatusDescription")
  @override
  String? statusDescription;
  @JsonKey(name: "ResponseData")
  ResponseData? responseData;

  AddOrderResponseModel({
    this.statusCode,
    this.statusDescription,
    this.responseData,
  });

  factory AddOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddOrderResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddOrderResponseModelToJson(this);
}

@JsonSerializable()
class ResponseData {
  @JsonKey(name: "redirectUrl")
  String redirectUrl;
  @JsonKey(name: "orderId")
  int orderId;

  ResponseData({
    required this.redirectUrl,
    required this.orderId,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}

// To parse this JSON data, do
//
//     final getOrdersResponseModel = getOrdersResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:miswag_clone/core/models/common_api/common_api_response.dart';

part 'get_orders_response_model.g.dart';

GetOrdersResponseModel getOrdersResponseModelFromJson(String str) =>
    GetOrdersResponseModel.fromJson(json.decode(str));

String getOrdersResponseModelToJson(GetOrdersResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetOrdersResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  int? statusCode;
  @JsonKey(name: "StatusDescription")
  @override
  String? statusDescription;
  @JsonKey(name: "ResponseData")
  ResponseData? responseData;

  GetOrdersResponseModel({
    this.statusCode,
    this.statusDescription,
    this.responseData,
  });

  factory GetOrdersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetOrdersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrdersResponseModelToJson(this);
}

@JsonSerializable()
class ResponseData {
  @JsonKey(name: "data")
  List<OrderHistory>? data;

  ResponseData({
    this.data,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}

@JsonSerializable()
class OrderHistory {
  @JsonKey(name: "ID")
  int id;
  @JsonKey(name: "TOTAL_AMOUNT")
  double totalAmount;
  @JsonKey(name: "IS_PAID")
  bool? isPaid;
  @JsonKey(name: "TOTAL_QUANTITY")
  int totalQuantity;
  @JsonKey(name: "INSERT_DATE")
  String insertDate;

  OrderHistory({
    required this.id,
    required this.totalAmount,
    this.isPaid,
    required this.totalQuantity,
    required this.insertDate,
  });

  factory OrderHistory.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$OrderHistoryToJson(this);
}

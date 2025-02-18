// To parse this JSON data, do
//
//     final getSingleOrderResponseModel = getSingleOrderResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:miswag_clone/core/models/common_api/common_api_response.dart';
import 'package:miswag_clone/core/models/order/order_payment/order_payment_result_response_model.dart';

part 'get_single_order_response_model.g.dart';

GetSingleOrderResponseModel getSingleOrderResponseModelFromJson(String str) =>
    GetSingleOrderResponseModel.fromJson(json.decode(str));

String getSingleOrderResponseModelToJson(GetSingleOrderResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetSingleOrderResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  int? statusCode;
  @JsonKey(name: "StatusDescription")
  @override
  String? statusDescription;
  @JsonKey(name: "ResponseData")
  ResponseData? responseData;

  GetSingleOrderResponseModel({
    this.statusCode,
    this.statusDescription,
    this.responseData,
  });

  factory GetSingleOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetSingleOrderResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetSingleOrderResponseModelToJson(this);
}

@JsonSerializable()
class ResponseData {
  @JsonKey(name: "data")
  OrderHistoryDetails data;

  ResponseData({
    required this.data,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}

@JsonSerializable()
class OrderHistoryDetails {
  @JsonKey(name: "ID")
  int id;
  @JsonKey(name: "TOTAL_AMOUNT")
  int totalAmount;
  @JsonKey(name: "IS_PAID")
  bool isPaid;
  @JsonKey(name: "TOTAL_QUANTITY")
  int totalQuantity;
  @JsonKey(name: "INSERT_DATE")
  String insertDate;
  @JsonKey(name: "ITEMS")
  List<OrderHistoryItem> carts;
  @JsonKey(name: "VOUCHERS")
  List<Voucher> vouchers;

  OrderHistoryDetails({
    required this.id,
    required this.totalAmount,
    required this.isPaid,
    required this.totalQuantity,
    required this.insertDate,
    required this.carts,
    required this.vouchers,
  });

  factory OrderHistoryDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderHistoryDetailsToJson(this);
}

@JsonSerializable()
class OrderHistoryItem {
  @JsonKey(name: "ID")
  int id;
  @JsonKey(name: "ITEM_NAME")
  String itemName;
  @JsonKey(name: "PROVIDER_NAME")
  String providerName;
  @JsonKey(name: "PRICE")
  int price;
  @JsonKey(name: "QUANTITY")
  int quantity;
  @JsonKey(name: "TOTAL_AMOUNT")
  double totalAmount;

  OrderHistoryItem({
    required this.id,
    required this.itemName,
    required this.providerName,
    required this.price,
    required this.quantity,
    required this.totalAmount,
  });

  factory OrderHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderHistoryItemToJson(this);
}

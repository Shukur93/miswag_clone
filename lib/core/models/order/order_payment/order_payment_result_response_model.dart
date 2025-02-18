// To parse this JSON data, do
//
//     final orderPaymentResultResponseModel = orderPaymentResultResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:miswag_clone/core/models/common_api/common_api_response.dart';

part 'order_payment_result_response_model.g.dart';

OrderPaymentResultResponseModel orderPaymentResultResponseModelFromJson(
        String str) =>
    OrderPaymentResultResponseModel.fromJson(json.decode(str));

String orderPaymentResultResponseModelToJson(
        OrderPaymentResultResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class OrderPaymentResultResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  int? statusCode;
  @JsonKey(name: "StatusDescription")
  @override
  String? statusDescription;
  @JsonKey(name: "ResponseData")
  ResponseData? responseData;

  OrderPaymentResultResponseModel({
    this.statusCode,
    this.statusDescription,
    this.responseData,
  });

  factory OrderPaymentResultResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrderPaymentResultResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OrderPaymentResultResponseModelToJson(this);
}

@JsonSerializable()
class ResponseData {
  @JsonKey(name: "IS_APPROVED")
  bool? isApproved;
  @JsonKey(name: "DESCCRIPTION")
  String? desccription;
  @JsonKey(name: "ID")
  int? id;
  @JsonKey(name: "TOTAL_AMOUNT")
  int? totalAmount;
  @JsonKey(name: "TOTAL_QUANTITY")
  int? totalQuantity;
  @JsonKey(name: "PAY_DATE")
  String? payDate;
  @JsonKey(name: "IS_PAID")
  bool? isPaid;
  @JsonKey(name: "vouchers")
  List<Voucher>? vouchers;

  ResponseData({
    this.isApproved,
    this.desccription,
    this.id,
    this.totalAmount,
    this.totalQuantity,
    this.payDate,
    this.isPaid,
    this.vouchers,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}

@JsonSerializable()
class Voucher {
  @JsonKey(name: "ID")
  int? id;
  @JsonKey(name: "ITEM_NAME")
  String itemName;
  @JsonKey(name: "IMAGE_PATH")
  String imagePath;
  @JsonKey(name: "PRICE")
  int price;
  @JsonKey(name: "PROVIDER_NAME")
  String providerName;
  @JsonKey(name: "SERIAL_CODE")
  String serialCode;
  @JsonKey(name: "SERIAL_NO")
  String serialNo;
  @JsonKey(name: "EXPIRY_DATE")
  String expiryDate;

  Voucher({
    this.id,
    required this.itemName,
    required this.imagePath,
    required this.price,
    required this.providerName,
    required this.serialCode,
    required this.serialNo,
    required this.expiryDate,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) =>
      _$VoucherFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherToJson(this);
}

// To parse this JSON data, do
//
//     final orderPaymentResultRequestModel = orderPaymentResultRequestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'order_payment_result_request_model.g.dart';

@JsonSerializable()
class OrderPaymentResultRequestModel {
  @JsonKey(name: "OrderId")
  int orderId;

  OrderPaymentResultRequestModel({
    required this.orderId,
  });

  Map<String, dynamic> toJson() => _$OrderPaymentResultRequestModelToJson(this);
}

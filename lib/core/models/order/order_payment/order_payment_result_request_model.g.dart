// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_payment_result_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPaymentResultRequestModel _$OrderPaymentResultRequestModelFromJson(
        Map<String, dynamic> json) =>
    OrderPaymentResultRequestModel(
      orderId: (json['OrderId'] as num).toInt(),
    );

Map<String, dynamic> _$OrderPaymentResultRequestModelToJson(
        OrderPaymentResultRequestModel instance) =>
    <String, dynamic>{
      'OrderId': instance.orderId,
    };

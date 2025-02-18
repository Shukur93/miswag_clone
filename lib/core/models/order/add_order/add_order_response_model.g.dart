// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrderResponseModel _$AddOrderResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddOrderResponseModel(
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      statusDescription: json['StatusDescription'] as String?,
      responseData: json['ResponseData'] == null
          ? null
          : ResponseData.fromJson(json['ResponseData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddOrderResponseModelToJson(
        AddOrderResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
      'ResponseData': instance.responseData,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      redirectUrl: json['redirectUrl'] as String,
      orderId: (json['orderId'] as num).toInt(),
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'redirectUrl': instance.redirectUrl,
      'orderId': instance.orderId,
    };

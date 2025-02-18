// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_orders_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrdersResponseModel _$GetOrdersResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetOrdersResponseModel(
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      statusDescription: json['StatusDescription'] as String?,
      responseData: json['ResponseData'] == null
          ? null
          : ResponseData.fromJson(json['ResponseData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetOrdersResponseModelToJson(
        GetOrdersResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
      'ResponseData': instance.responseData,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OrderHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

OrderHistory _$OrderHistoryFromJson(Map<String, dynamic> json) => OrderHistory(
      id: (json['ID'] as num).toInt(),
      totalAmount: (json['TOTAL_AMOUNT'] as num).toDouble(),
      isPaid: json['IS_PAID'] as bool?,
      totalQuantity: (json['TOTAL_QUANTITY'] as num).toInt(),
      insertDate: json['INSERT_DATE'] as String,
    );

Map<String, dynamic> _$OrderHistoryToJson(OrderHistory instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'TOTAL_AMOUNT': instance.totalAmount,
      'IS_PAID': instance.isPaid,
      'TOTAL_QUANTITY': instance.totalQuantity,
      'INSERT_DATE': instance.insertDate,
    };

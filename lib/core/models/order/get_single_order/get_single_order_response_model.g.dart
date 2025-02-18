// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_single_order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSingleOrderResponseModel _$GetSingleOrderResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetSingleOrderResponseModel(
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      statusDescription: json['StatusDescription'] as String?,
      responseData: json['ResponseData'] == null
          ? null
          : ResponseData.fromJson(json['ResponseData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSingleOrderResponseModelToJson(
        GetSingleOrderResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
      'ResponseData': instance.responseData,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      data: OrderHistoryDetails.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

OrderHistoryDetails _$OrderHistoryDetailsFromJson(Map<String, dynamic> json) =>
    OrderHistoryDetails(
      id: (json['ID'] as num).toInt(),
      totalAmount: (json['TOTAL_AMOUNT'] as num).toInt(),
      isPaid: json['IS_PAID'] as bool,
      totalQuantity: (json['TOTAL_QUANTITY'] as num).toInt(),
      insertDate: json['INSERT_DATE'] as String,
      carts: (json['ITEMS'] as List<dynamic>)
          .map((e) => OrderHistoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      vouchers: (json['VOUCHERS'] as List<dynamic>)
          .map((e) => Voucher.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderHistoryDetailsToJson(
        OrderHistoryDetails instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'TOTAL_AMOUNT': instance.totalAmount,
      'IS_PAID': instance.isPaid,
      'TOTAL_QUANTITY': instance.totalQuantity,
      'INSERT_DATE': instance.insertDate,
      'ITEMS': instance.carts,
      'VOUCHERS': instance.vouchers,
    };

OrderHistoryItem _$OrderHistoryItemFromJson(Map<String, dynamic> json) =>
    OrderHistoryItem(
      id: (json['ID'] as num).toInt(),
      itemName: json['ITEM_NAME'] as String,
      providerName: json['PROVIDER_NAME'] as String,
      price: (json['PRICE'] as num).toInt(),
      quantity: (json['QUANTITY'] as num).toInt(),
      totalAmount: (json['TOTAL_AMOUNT'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderHistoryItemToJson(OrderHistoryItem instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ITEM_NAME': instance.itemName,
      'PROVIDER_NAME': instance.providerName,
      'PRICE': instance.price,
      'QUANTITY': instance.quantity,
      'TOTAL_AMOUNT': instance.totalAmount,
    };

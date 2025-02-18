// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_payment_result_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPaymentResultResponseModel _$OrderPaymentResultResponseModelFromJson(
        Map<String, dynamic> json) =>
    OrderPaymentResultResponseModel(
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      statusDescription: json['StatusDescription'] as String?,
      responseData: json['ResponseData'] == null
          ? null
          : ResponseData.fromJson(json['ResponseData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderPaymentResultResponseModelToJson(
        OrderPaymentResultResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
      'ResponseData': instance.responseData,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      isApproved: json['IS_APPROVED'] as bool?,
      desccription: json['DESCCRIPTION'] as String?,
      id: (json['ID'] as num?)?.toInt(),
      totalAmount: (json['TOTAL_AMOUNT'] as num?)?.toInt(),
      totalQuantity: (json['TOTAL_QUANTITY'] as num?)?.toInt(),
      payDate: json['PAY_DATE'] as String?,
      isPaid: json['IS_PAID'] as bool?,
      vouchers: (json['vouchers'] as List<dynamic>?)
          ?.map((e) => Voucher.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'IS_APPROVED': instance.isApproved,
      'DESCCRIPTION': instance.desccription,
      'ID': instance.id,
      'TOTAL_AMOUNT': instance.totalAmount,
      'TOTAL_QUANTITY': instance.totalQuantity,
      'PAY_DATE': instance.payDate,
      'IS_PAID': instance.isPaid,
      'vouchers': instance.vouchers,
    };

Voucher _$VoucherFromJson(Map<String, dynamic> json) => Voucher(
      id: (json['ID'] as num?)?.toInt(),
      itemName: json['ITEM_NAME'] as String,
      imagePath: json['IMAGE_PATH'] as String,
      price: (json['PRICE'] as num).toInt(),
      providerName: json['PROVIDER_NAME'] as String,
      serialCode: json['SERIAL_CODE'] as String,
      serialNo: json['SERIAL_NO'] as String,
      expiryDate: json['EXPIRY_DATE'] as String,
    );

Map<String, dynamic> _$VoucherToJson(Voucher instance) => <String, dynamic>{
      'ID': instance.id,
      'ITEM_NAME': instance.itemName,
      'IMAGE_PATH': instance.imagePath,
      'PRICE': instance.price,
      'PROVIDER_NAME': instance.providerName,
      'SERIAL_CODE': instance.serialCode,
      'SERIAL_NO': instance.serialNo,
      'EXPIRY_DATE': instance.expiryDate,
    };

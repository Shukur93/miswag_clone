// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_items_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetItemsResponseModel _$GetItemsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetItemsResponseModel(
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      statusDescription: json['StatusDescription'] as String?,
      responseData: json['ResponseData'] == null
          ? null
          : ResponseData.fromJson(json['ResponseData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetItemsResponseModelToJson(
        GetItemsResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
      'ResponseData': instance.responseData,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      data: (json['data'] as List<dynamic>)
          .map((e) => ItemsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ItemsData _$ItemsDataFromJson(Map<String, dynamic> json) => ItemsData(
      id: (json['ID'] as num?)?.toInt(),
      itemName: json['ITEM_NAME'] as String?,
      price: (json['PRICE'] as num?)?.toDouble(),
      description: json['DESCRIPTION'] as String?,
      imagePath: json['IMAGE_PATH'] as String?,
      insertDate: json['INSERT_DATE'] as String?,
    );

Map<String, dynamic> _$ItemsDataToJson(ItemsData instance) => <String, dynamic>{
      'ID': instance.id,
      'ITEM_NAME': instance.itemName,
      'PRICE': instance.price,
      'DESCRIPTION': instance.description,
      'IMAGE_PATH': instance.imagePath,
      'INSERT_DATE': instance.insertDate,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_home_data_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHomeDataResponseModel _$GetHomeDataResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetHomeDataResponseModel(
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      statusDescription: json['StatusDescription'] as String?,
      responseData: json['ResponseData'] == null
          ? null
          : ResponseData.fromJson(json['ResponseData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetHomeDataResponseModelToJson(
        GetHomeDataResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
      'ResponseData': instance.responseData,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      earthlinkGroupUrl: json['EARTHLINK_GROUP_URL'] as String?,
      advertisements: json['advertisements'] as List<dynamic>,
      providers: (json['providers'] as List<dynamic>)
          .map((e) => ProvidersData.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryItems: HomeCategoryItems.fromJson(
          json['categoryItems'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'EARTHLINK_GROUP_URL': instance.earthlinkGroupUrl,
      'advertisements': instance.advertisements,
      'providers': instance.providers,
      'categoryItems': instance.categoryItems,
    };

HomeCategoryItems _$HomeCategoryItemsFromJson(Map<String, dynamic> json) =>
    HomeCategoryItems(
      id: (json['ID'] as num).toInt(),
      categoryName: json['CATEGORY_NAME'] as String,
      items: (json['ITEMS'] as List<dynamic>)
          .map((e) => ItemsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeCategoryItemsToJson(HomeCategoryItems instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CATEGORY_NAME': instance.categoryName,
      'ITEMS': instance.items,
    };

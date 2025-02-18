// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_items_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetItemsRequestModel _$GetItemsRequestModelFromJson(
        Map<String, dynamic> json) =>
    GetItemsRequestModel(
      providerId: (json['ProviderId'] as num?)?.toInt(),
      categoryId: (json['CategoryId'] as num?)?.toInt(),
      keyword: json['Keyword'] as String?,
    );

Map<String, dynamic> _$GetItemsRequestModelToJson(
        GetItemsRequestModel instance) =>
    <String, dynamic>{
      'ProviderId': instance.providerId,
      'CategoryId': instance.categoryId,
      'Keyword': instance.keyword,
    };

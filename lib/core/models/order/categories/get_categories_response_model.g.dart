// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_categories_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoriesResponseModel _$GetCategoriesResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetCategoriesResponseModel(
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      statusDescription: json['StatusDescription'] as String?,
      responseData: json['ResponseData'] == null
          ? null
          : ResponseData.fromJson(json['ResponseData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCategoriesResponseModelToJson(
        GetCategoriesResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
      'ResponseData': instance.responseData,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      data: (json['data'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['ID'] as num).toInt(),
      categoryName: json['CATEGORY_NAME'] as String,
      description: json['DESCRIPTION'] as String,
      insertDate: json['INSERT_DATE'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'ID': instance.id,
      'CATEGORY_NAME': instance.categoryName,
      'DESCRIPTION': instance.description,
      'INSERT_DATE': instance.insertDate,
    };

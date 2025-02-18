// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_providers_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProvidersResponseModel _$GetProvidersResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetProvidersResponseModel(
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      statusDescription: json['StatusDescription'] as String?,
      responseData: json['ResponseData'] == null
          ? null
          : ResponseData.fromJson(json['ResponseData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetProvidersResponseModelToJson(
        GetProvidersResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
      'ResponseData': instance.responseData,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      data: (json['data'] as List<dynamic>)
          .map((e) => ProvidersData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProvidersData _$ProvidersDataFromJson(Map<String, dynamic> json) =>
    ProvidersData(
      id: (json['ID'] as num).toInt(),
      providerName: json['PROVIDER_NAME'] as String,
      description: json['DESCRIPTION'] as String,
      imagePath: json['IMAGE_PATH'] as String,
      insertDate: json['INSERT_DATE'] as String,
    );

Map<String, dynamic> _$ProvidersDataToJson(ProvidersData instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'PROVIDER_NAME': instance.providerName,
      'DESCRIPTION': instance.description,
      'IMAGE_PATH': instance.imagePath,
      'INSERT_DATE': instance.insertDate,
    };

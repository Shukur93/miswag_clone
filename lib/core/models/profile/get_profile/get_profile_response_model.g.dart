// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileResponseModel _$GetProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetProfileResponseModel(
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      statusDescription: json['StatusDescription'] as String?,
      responseData: json['ResponseData'] == null
          ? null
          : ResponseData.fromJson(json['ResponseData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetProfileResponseModelToJson(
        GetProfileResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
      'ResponseData': instance.responseData,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      firstName: json['FIRST_NAME'] as String?,
      lastName: json['LAST_NAME'] as String?,
      phoneNo: json['PHONE_NO'] as String?,
      email: json['EMAIL'] as String?,
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'FIRST_NAME': instance.firstName,
      'LAST_NAME': instance.lastName,
      'PHONE_NO': instance.phoneNo,
      'EMAIL': instance.email,
    };

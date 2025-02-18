// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordResponseModel _$ChangePasswordResponseModelFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordResponseModel(
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      statusDescription: json['StatusDescription'] as String?,
    );

Map<String, dynamic> _$ChangePasswordResponseModelToJson(
        ChangePasswordResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
    };

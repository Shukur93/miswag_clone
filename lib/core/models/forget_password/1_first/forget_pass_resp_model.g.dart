// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_pass_resp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordResponseModel _$ForgetPasswordResponseModelFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordResponseModel(
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      statusDescription: json['StatusDescription'] as String?,
    );

Map<String, dynamic> _$ForgetPasswordResponseModelToJson(
        ForgetPasswordResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
    };

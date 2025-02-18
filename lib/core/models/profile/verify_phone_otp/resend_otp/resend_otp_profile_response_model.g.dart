// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendOtpProfileResponseModel _$ResendOtpProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    ResendOtpProfileResponseModel(
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      statusDescription: json['StatusDescription'] as String?,
    );

Map<String, dynamic> _$ResendOtpProfileResponseModelToJson(
        ResendOtpProfileResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
    };

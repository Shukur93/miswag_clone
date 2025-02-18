// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_phone_profile_with_otp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyPhoneProfileWithOtpResponseModel
    _$VerifyPhoneProfileWithOtpResponseModelFromJson(
            Map<String, dynamic> json) =>
        VerifyPhoneProfileWithOtpResponseModel(
          statusCode: (json['StatusCode'] as num?)?.toInt(),
          statusDescription: json['StatusDescription'] as String?,
        );

Map<String, dynamic> _$VerifyPhoneProfileWithOtpResponseModelToJson(
        VerifyPhoneProfileWithOtpResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
    };

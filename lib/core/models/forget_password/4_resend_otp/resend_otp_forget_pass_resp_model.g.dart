// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_forget_pass_resp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendOtpForgetPasswordResponseModel
    _$ResendOtpForgetPasswordResponseModelFromJson(Map<String, dynamic> json) =>
        ResendOtpForgetPasswordResponseModel(
          statusCode: (json['StatusCode'] as num?)?.toInt(),
          statusDescription: json['StatusDescription'] as String?,
        );

Map<String, dynamic> _$ResendOtpForgetPasswordResponseModelToJson(
        ResendOtpForgetPasswordResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
    };

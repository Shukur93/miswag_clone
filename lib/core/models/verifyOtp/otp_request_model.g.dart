// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPRequestModel _$OTPRequestModelFromJson(Map<String, dynamic> json) =>
    OTPRequestModel(
      userId: (json['UserId'] as num).toInt(),
      phoneNo: json['PhoneNo'] as String,
      otp: json['Otp'] as String,
    );

Map<String, dynamic> _$OTPRequestModelToJson(OTPRequestModel instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'PhoneNo': instance.phoneNo,
      'Otp': instance.otp,
    };

ResendOTPRequestModel _$ResendOTPRequestModelFromJson(
        Map<String, dynamic> json) =>
    ResendOTPRequestModel(
      userId: (json['UserId'] as num).toInt(),
      phoneNo: json['PhoneNo'] as String,
    );

Map<String, dynamic> _$ResendOTPRequestModelToJson(
        ResendOTPRequestModel instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'PhoneNo': instance.phoneNo,
    };

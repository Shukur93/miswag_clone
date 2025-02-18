// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_fp_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyFpRequestModel _$VerifyFpRequestModelFromJson(
        Map<String, dynamic> json) =>
    VerifyFpRequestModel(
      phoneNo: json['PhoneNo'] as String,
      otp: json['Otp'] as String,
    );

Map<String, dynamic> _$VerifyFpRequestModelToJson(
        VerifyFpRequestModel instance) =>
    <String, dynamic>{
      'PhoneNo': instance.phoneNo,
      'Otp': instance.otp,
    };

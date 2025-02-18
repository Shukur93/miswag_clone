// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    LoginRequestModel(
      phoneNo: json['phoneNo'] as String,
      password: json['password'] as String,
      deviceToken: json['deviceToken'] as String,
      deviceId: json['deviceId'] as String,
    );

Map<String, dynamic> _$LoginRequestModelToJson(LoginRequestModel instance) =>
    <String, dynamic>{
      'phoneNo': instance.phoneNo,
      'password': instance.password,
      'deviceToken': instance.deviceToken,
      'deviceId': instance.deviceId,
    };

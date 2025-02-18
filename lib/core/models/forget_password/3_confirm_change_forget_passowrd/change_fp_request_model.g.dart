// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_fp_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeFpRequestModel _$ChangeFpRequestModelFromJson(
        Map<String, dynamic> json) =>
    ChangeFpRequestModel(
      newPassword: json['NewPassword'] as String,
      passwordConfirmation: json['PasswordConfirmation'] as String,
    );

Map<String, dynamic> _$ChangeFpRequestModelToJson(
        ChangeFpRequestModel instance) =>
    <String, dynamic>{
      'NewPassword': instance.newPassword,
      'PasswordConfirmation': instance.passwordConfirmation,
    };

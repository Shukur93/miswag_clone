// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequestModel _$ChangePasswordRequestModelFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordRequestModel(
      currentPassword: json['CurrentPassword'] as String,
      newPassword: json['NewPassword'] as String,
      passwordConfirmation: json['PasswordConfirmation'] as String,
    );

Map<String, dynamic> _$ChangePasswordRequestModelToJson(
        ChangePasswordRequestModel instance) =>
    <String, dynamic>{
      'CurrentPassword': instance.currentPassword,
      'NewPassword': instance.newPassword,
      'PasswordConfirmation': instance.passwordConfirmation,
    };

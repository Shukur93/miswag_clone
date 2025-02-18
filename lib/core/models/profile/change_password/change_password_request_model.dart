// To parse this JSON data, do
//
//     final changePasswordRequestModel = changePasswordRequestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'change_password_request_model.g.dart';

@JsonSerializable()
class ChangePasswordRequestModel {
  @JsonKey(name: "CurrentPassword")
  String currentPassword;
  @JsonKey(name: "NewPassword")
  String newPassword;
  @JsonKey(name: "PasswordConfirmation")
  String passwordConfirmation;

  ChangePasswordRequestModel({
    required this.currentPassword,
    required this.newPassword,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => _$ChangePasswordRequestModelToJson(this);
}

// To parse this JSON data, do
//
//     final changeFpRequestModel = changeFpRequestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'change_fp_request_model.g.dart';

@JsonSerializable()
class ChangeFpRequestModel {
  @JsonKey(name: "NewPassword")
  String newPassword;
  @JsonKey(name: "PasswordConfirmation")
  String passwordConfirmation;

  ChangeFpRequestModel({
    required this.newPassword,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => _$ChangeFpRequestModelToJson(this);
}

// To parse this JSON data, do
//
//     final loginRequestModel = loginRequestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'login_request_model.g.dart';

LoginRequestModel loginRequestModelFromJson(String str) =>
    LoginRequestModel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginRequestModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class LoginRequestModel {
  @JsonKey(name: "phoneNo")
  String phoneNo;
  @JsonKey(name: "password")
  String password;
  @JsonKey(name: "deviceToken")
  String deviceToken;
  @JsonKey(name: "deviceId")
  String deviceId;

  LoginRequestModel({
    required this.phoneNo,
    required this.password,
    required this.deviceToken,
    required this.deviceId,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}

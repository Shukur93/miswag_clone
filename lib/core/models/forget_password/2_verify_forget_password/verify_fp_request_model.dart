// To parse this JSON data, do
//
//     final verifyFpRequestModel = verifyFpRequestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'verify_fp_request_model.g.dart';

@JsonSerializable()
class VerifyFpRequestModel {
  @JsonKey(name: "PhoneNo")
  String phoneNo;
  @JsonKey(name: "Otp")
  String otp;

  VerifyFpRequestModel({
    required this.phoneNo,
    required this.otp,
  });

  Map<String, dynamic> toJson() => _$VerifyFpRequestModelToJson(this);
}

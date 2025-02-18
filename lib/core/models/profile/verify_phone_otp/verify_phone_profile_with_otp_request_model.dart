// To parse this JSON data, do
//
//     final VerifyPhoneProfileWithOtpRequestModel = VerifyPhoneProfileWithOtpRequestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'verify_phone_profile_with_otp_request_model.g.dart';

@JsonSerializable()
class VerifyPhoneProfileWithOtpRequestModel {
  @JsonKey(name: "Otp")
  String otp;

  VerifyPhoneProfileWithOtpRequestModel({
    required this.otp,
  });

  Map<String, dynamic> toJson() =>
      _$VerifyPhoneProfileWithOtpRequestModelToJson(this);
}

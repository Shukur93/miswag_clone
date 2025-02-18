// To parse this JSON data, do
//
//     final resendOtpProfileRequestModel = resendOtpProfileRequestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_profile_request_model.g.dart';

@JsonSerializable()
class ResendOtpProfileRequestModel {
  @JsonKey(name: "PhoneNo")
  String phoneNo;

  ResendOtpProfileRequestModel({
    required this.phoneNo,
  });

  Map<String, dynamic> toJson() => _$ResendOtpProfileRequestModelToJson(this);
}

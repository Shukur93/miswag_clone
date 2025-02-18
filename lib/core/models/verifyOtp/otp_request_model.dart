// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'otp_request_model.g.dart';

@JsonSerializable()
class OTPRequestModel {
  @JsonKey(name: 'UserId')
  int userId;
  @JsonKey(name: 'PhoneNo')
  String phoneNo;
  @JsonKey(name: 'Otp')
  String otp;

  OTPRequestModel({
    required this.userId,
    required this.phoneNo,
    required this.otp,
  });

  // ToJson
  Map<String, dynamic> toJson() => _$OTPRequestModelToJson(this);
}

// *-*-*-*-*-*-*- RESEND OTP MODEL *-*
@JsonSerializable()
class ResendOTPRequestModel {
  @JsonKey(name: 'UserId')
  int userId;
  @JsonKey(name: 'PhoneNo')
  String phoneNo;
  ResendOTPRequestModel({
    required this.userId,
    required this.phoneNo,
  });
  // toJson
  Map<String, dynamic> toJson() => _$ResendOTPRequestModelToJson(this);
}

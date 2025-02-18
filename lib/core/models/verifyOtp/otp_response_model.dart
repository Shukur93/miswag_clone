// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:miswag_clone/core/models/common_api/common_api_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_response_model.g.dart';

@JsonSerializable()
class OTPResponseModel implements CommonApiResponse {
  @JsonKey(name: 'StatusCode')
  @override
  int? statusCode;
  @JsonKey(name: 'StatusDescription')
  @override
  String? statusDescription;

  OTPResponseModel({
    this.statusCode,
    this.statusDescription,
  });

  factory OTPResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OTPResponseModelFromJson(json);
}

// RESEND OTP MODEL
@JsonSerializable()
class ResendOTPResponseModel implements CommonApiResponse {
  @JsonKey(name: 'StatusCode')
  @override
  int? statusCode;
  @JsonKey(name: 'StatusDescription')
  @override
  String? statusDescription;
  ResendOTPResponseModel({
    this.statusCode,
    this.statusDescription,
  });

  factory ResendOTPResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResendOTPResponseModelFromJson(json);
}

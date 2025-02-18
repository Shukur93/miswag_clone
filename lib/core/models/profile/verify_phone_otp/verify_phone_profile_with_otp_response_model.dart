// To parse this JSON data, do
//
//     final VerifyPhoneProfileWithOtpResponseModel = VerifyPhoneProfileWithOtpResponseModelFromJson(jsonString);

import 'package:miswag_clone/core/models/common_api/common_api_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'verify_phone_profile_with_otp_response_model.g.dart';

@JsonSerializable()
class VerifyPhoneProfileWithOtpResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  int? statusCode;
  @JsonKey(name: "StatusDescription")
  @override
  String? statusDescription;

  VerifyPhoneProfileWithOtpResponseModel({
    this.statusCode,
    this.statusDescription,
  });

  factory VerifyPhoneProfileWithOtpResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$VerifyPhoneProfileWithOtpResponseModelFromJson(json);
}

// To parse this JSON data, do
//
//     final resendOtpProfileResponseModel = resendOtpProfileResponseModelFromJson(jsonString);

import 'package:miswag_clone/core/models/common_api/common_api_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_profile_response_model.g.dart';

@JsonSerializable()
class ResendOtpProfileResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  int? statusCode;
  @JsonKey(name: "StatusDescription")
  @override
  String? statusDescription;

  ResendOtpProfileResponseModel({
    this.statusCode,
    this.statusDescription,
  });

  factory ResendOtpProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpProfileResponseModelFromJson(json);
}

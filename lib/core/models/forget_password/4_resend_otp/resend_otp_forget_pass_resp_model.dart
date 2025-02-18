// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:miswag_clone/core/models/common_api/common_api_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'resend_otp_forget_pass_resp_model.g.dart';

@JsonSerializable()
class ResendOtpForgetPasswordResponseModel implements CommonApiResponse {
  @JsonKey(name: 'StatusCode')
  @override
  int? statusCode;
  @JsonKey(name: 'StatusDescription')
  @override
  String? statusDescription;
  ResendOtpForgetPasswordResponseModel({
    this.statusCode,
    this.statusDescription,
  });

  // FromJson
  factory ResendOtpForgetPasswordResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$ResendOtpForgetPasswordResponseModelFromJson(json);
}

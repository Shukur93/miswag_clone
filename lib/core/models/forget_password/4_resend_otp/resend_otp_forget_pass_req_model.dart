// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
part 'resend_otp_forget_pass_req_model.g.dart';

@JsonSerializable()
class ResendOtpForgetPasswordRequestModel {
  @JsonKey(name: 'PhoneNo')
  String phoneNo;
  ResendOtpForgetPasswordRequestModel({
    required this.phoneNo,
  });

  // ToJson
  Map<String, dynamic> toJson() =>
      _$ResendOtpForgetPasswordRequestModelToJson(this);
}

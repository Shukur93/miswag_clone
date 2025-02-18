// To parse this JSON data, do
//
//     final verifyFpResponseModel = verifyFpResponseModelFromJson(jsonString);

import 'package:miswag_clone/core/models/common_api/common_api_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_fp_response_model.g.dart';

@JsonSerializable()
class VerifyFpResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  int? statusCode;
  @JsonKey(name: "StatusDescription")
  @override
  String? statusDescription;
  @JsonKey(name: "ResponseData")
  ResponseData? responseData;

  VerifyFpResponseModel({
    this.statusCode,
    this.statusDescription,
    this.responseData,
  });

  factory VerifyFpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyFpResponseModelFromJson(json);
}

@JsonSerializable()
class ResponseData {
  @JsonKey(name: "Token")
  String token;

  ResponseData({
    required this.token,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);
}

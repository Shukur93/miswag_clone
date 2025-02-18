// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:miswag_clone/core/models/common_api/common_api_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'forget_pass_resp_model.g.dart';

@JsonSerializable()
class ForgetPasswordResponseModel implements CommonApiResponse {
  @JsonKey(name: 'StatusCode')
  @override
  int? statusCode;
  @JsonKey(name: 'StatusDescription')
  @override
  String? statusDescription;
  ForgetPasswordResponseModel({
    this.statusCode,
    this.statusDescription,
  });

  // FromJson
  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseModelFromJson(json);
}

import 'package:miswag_clone/core/models/common_api/common_api_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'change_password_response_model.g.dart';

@JsonSerializable()
class ChangePasswordResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  int? statusCode;
  @JsonKey(name: "StatusDescription")
  @override
  String? statusDescription;

  ChangePasswordResponseModel({
    this.statusCode,
    this.statusDescription,
  });

  factory ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseModelFromJson(json);
}

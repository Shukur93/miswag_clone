import 'package:miswag_clone/core/models/common_api/common_api_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  int? statusCode;
  @JsonKey(name: "StatusDescription")
  @override
  String? statusDescription;
  @JsonKey(name: "ResponseData")
  ResponseData? responseData;

  LoginResponseModel({
    this.statusCode,
    this.statusDescription,
    this.responseData,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  // Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class ResponseData {
  @JsonKey(name: "Token")
  String? token;
  @JsonKey(name: "fullName")
  String? fullName;
  @JsonKey(name: "PHONE_NO")
  String? phoneNo;

  ResponseData({
    this.token,
    this.fullName,
    this.phoneNo,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  // Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}

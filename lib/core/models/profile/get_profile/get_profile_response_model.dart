// To parse this JSON data, do
//
//     final getProfileResponseModel = getProfileResponseModelFromJson(jsonString);
import 'package:miswag_clone/core/models/common_api/common_api_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'get_profile_response_model.g.dart';

GetProfileResponseModel getProfileResponseModelFromJson(String str) =>
    GetProfileResponseModel.fromJson(json.decode(str));

String getProfileResponseModelToJson(GetProfileResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetProfileResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  int? statusCode;
  @JsonKey(name: "StatusDescription")
  @override
  String? statusDescription;
  @JsonKey(name: "ResponseData")
  ResponseData? responseData;

  GetProfileResponseModel({
    this.statusCode,
    this.statusDescription,
    this.responseData,
  });

  factory GetProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProfileResponseModelToJson(this);
}

@JsonSerializable()
class ResponseData {
  @JsonKey(name: "FIRST_NAME")
  String? firstName;
  @JsonKey(name: "LAST_NAME")
  String? lastName;
  @JsonKey(name: "PHONE_NO")
  String? phoneNo;
  @JsonKey(name: "EMAIL")
  String? email;

  ResponseData({
    this.firstName,
    this.lastName,
    this.phoneNo,
    this.email,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}

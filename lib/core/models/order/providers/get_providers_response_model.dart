// To parse this JSON data, do
//
//     final getProvidersResponseModel = getProvidersResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:miswag_clone/core/models/common_api/common_api_response.dart';

part 'get_providers_response_model.g.dart';

GetProvidersResponseModel getProvidersResponseModelFromJson(String str) =>
    GetProvidersResponseModel.fromJson(json.decode(str));

String getProvidersResponseModelToJson(GetProvidersResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetProvidersResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  int? statusCode;
  @JsonKey(name: "StatusDescription")
  @override
  String? statusDescription;
  @JsonKey(name: "ResponseData")
  ResponseData? responseData;

  GetProvidersResponseModel({
    this.statusCode,
    this.statusDescription,
    this.responseData,
  });

  factory GetProvidersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetProvidersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProvidersResponseModelToJson(this);
}

@JsonSerializable()
class ResponseData {
  @JsonKey(name: "data")
  List<ProvidersData> data;

  ResponseData({
    required this.data,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}

@JsonSerializable()
class ProvidersData {
  @JsonKey(name: "ID")
  int id;
  @JsonKey(name: "PROVIDER_NAME")
  String providerName;
  @JsonKey(name: "DESCRIPTION")
  String description;
  @JsonKey(name: "IMAGE_PATH")
  String imagePath;
  @JsonKey(name: "INSERT_DATE")
  String insertDate;

  ProvidersData({
    required this.id,
    required this.providerName,
    required this.description,
    required this.imagePath,
    required this.insertDate,
  });

  factory ProvidersData.fromJson(Map<String, dynamic> json) =>
      _$ProvidersDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProvidersDataToJson(this);
}

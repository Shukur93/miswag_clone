// To parse this JSON data, do
//
//     final getCategoriesResponseModel = getCategoriesResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:miswag_clone/core/models/common_api/common_api_response.dart';

part 'get_categories_response_model.g.dart';

GetCategoriesResponseModel getCategoriesResponseModelFromJson(String str) =>
    GetCategoriesResponseModel.fromJson(json.decode(str));

String getCategoriesResponseModelToJson(GetCategoriesResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetCategoriesResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  int? statusCode;
  @JsonKey(name: "StatusDescription")
  @override
  String? statusDescription;
  @JsonKey(name: "ResponseData")
  ResponseData? responseData;

  GetCategoriesResponseModel({
    this.statusCode,
    this.statusDescription,
    this.responseData,
  });

  factory GetCategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetCategoriesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoriesResponseModelToJson(this);
}

@JsonSerializable()
class ResponseData {
  @JsonKey(name: "data")
  List<Category> data;

  ResponseData({
    required this.data,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: "ID")
  int id;
  @JsonKey(name: "CATEGORY_NAME")
  String categoryName;
  @JsonKey(name: "DESCRIPTION")
  String description;
  @JsonKey(name: "INSERT_DATE")
  String insertDate;

  Category({
    required this.id,
    required this.categoryName,
    required this.description,
    required this.insertDate,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

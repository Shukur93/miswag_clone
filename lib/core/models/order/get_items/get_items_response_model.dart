// To parse this JSON data, do
//
//     final getItemsResponseModel = getItemsResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:miswag_clone/core/models/common_api/common_api_response.dart';

part 'get_items_response_model.g.dart';

GetItemsResponseModel getItemsResponseModelFromJson(String str) =>
    GetItemsResponseModel.fromJson(json.decode(str));

@JsonSerializable()
class GetItemsResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  int? statusCode;
  @JsonKey(name: "StatusDescription")
  @override
  String? statusDescription;
  @JsonKey(name: "ResponseData")
  ResponseData? responseData;

  GetItemsResponseModel({
    this.statusCode,
    this.statusDescription,
    this.responseData,
  });

  factory GetItemsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetItemsResponseModelFromJson(json);
}

@JsonSerializable()
class ResponseData {
  @JsonKey(name: "data")
  List<ItemsData> data;

  ResponseData({
    required this.data,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);
}

@JsonSerializable()
class ItemsData {
  @JsonKey(name: "ID")
  int? id;
  @JsonKey(name: "ITEM_NAME")
  String? itemName;
  @JsonKey(name: "PRICE")
  double? price;
  @JsonKey(name: "DESCRIPTION")
  String? description;
  @JsonKey(name: "IMAGE_PATH")
  String? imagePath;
  @JsonKey(name: "INSERT_DATE")
  String? insertDate;

  ItemsData({
    this.id,
    this.itemName,
    this.price,
    this.description,
    this.imagePath,
    this.insertDate,
  });

  factory ItemsData.fromJson(Map<String, dynamic> json) =>
      _$ItemsDataFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$ItemsDataToJson(this);
}

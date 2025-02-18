// To parse this JSON data, do
//
//     final getHomeDataResponseModel = getHomeDataResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:miswag_clone/core/models/common_api/common_api_response.dart';
import 'package:miswag_clone/core/models/order/get_items/get_items_response_model.dart';
import 'package:miswag_clone/core/models/order/providers/get_providers_response_model.dart';

part 'get_home_data_response_model.g.dart';

GetHomeDataResponseModel getHomeDataResponseModelFromJson(String str) =>
    GetHomeDataResponseModel.fromJson(json.decode(str));

String getHomeDataResponseModelToJson(GetHomeDataResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetHomeDataResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  int? statusCode;
  @JsonKey(name: "StatusDescription")
  @override
  String? statusDescription;
  @JsonKey(name: "ResponseData")
  ResponseData? responseData;

  GetHomeDataResponseModel({
    this.statusCode,
    this.statusDescription,
    this.responseData,
  });

  factory GetHomeDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetHomeDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeDataResponseModelToJson(this);
}

@JsonSerializable()
class ResponseData {
  @JsonKey(name: "EARTHLINK_GROUP_URL")
  String? earthlinkGroupUrl;
  @JsonKey(name: "advertisements")
  List<dynamic> advertisements;
  @JsonKey(name: "providers")
  List<ProvidersData> providers;
  @JsonKey(name: "categoryItems")
  HomeCategoryItems categoryItems;

  ResponseData({
    this.earthlinkGroupUrl,
    required this.advertisements,
    required this.providers,
    required this.categoryItems,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}

@JsonSerializable()
class HomeCategoryItems {
  @JsonKey(name: "ID")
  int id;
  @JsonKey(name: "CATEGORY_NAME")
  String categoryName;
  @JsonKey(name: "ITEMS")
  List<ItemsData> items;

  HomeCategoryItems({
    required this.id,
    required this.categoryName,
    required this.items,
  });

  factory HomeCategoryItems.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryItemsFromJson(json);

  Map<String, dynamic> toJson() => _$HomeCategoryItemsToJson(this);
}

// @JsonSerializable()
// class CategoryItemsData {
//   @JsonKey(name: "ID")
//   int id;
//   @JsonKey(name: "ITEM_NAME")
//   String itemName;
//   @JsonKey(name: "DESCRIPTION")
//   String description;
//   @JsonKey(name: "PRICE")
//   int price;
//   @JsonKey(name: "IMAGE_PATH")
//   String imagePath;

//   CategoryItemsData({
//     required this.id,
//     required this.itemName,
//     required this.description,
//     required this.price,
//     required this.imagePath,
//   });

//   factory CategoryItemsData.fromJson(Map<String, dynamic> json) => _$CategoryItemsDataFromJson(json);

//   Map<String, dynamic> toJson() => _$CategoryItemsDataToJson(this);
// }

// @JsonSerializable()
// class HomeProvidersList {
//   @JsonKey(name: "PROVIDER_NAME")
//   String providerName;
//   @JsonKey(name: "DESCRIPTION")
//   String description;
//   @JsonKey(name: "IMAGE_PATH")
//   String imagePath;

//   HomeProvidersList({
//     required this.providerName,
//     required this.description,
//     required this.imagePath,
//   });

//   factory HomeProvidersList.fromJson(Map<String, dynamic> json) =>
//       _$HomeProvidersListFromJson(json);

//   Map<String, dynamic> toJson() => _$HomeProvidersListToJson(this);
// }

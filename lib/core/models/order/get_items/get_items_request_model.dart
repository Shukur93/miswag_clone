// To parse this JSON data, do
//
//     final getItemsRequestModel = getItemsRequestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'get_items_request_model.g.dart';

GetItemsRequestModel getItemsRequestModelFromJson(String str) =>
    GetItemsRequestModel.fromJson(json.decode(str));

String getItemsRequestModelToJson(GetItemsRequestModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetItemsRequestModel {
  @JsonKey(name: "ProviderId")
  int? providerId;
  @JsonKey(name: "CategoryId")
  int? categoryId;
  @JsonKey(name: "Keyword")
  String? keyword;

  GetItemsRequestModel({
    this.providerId,
    this.categoryId,
    this.keyword,
  });

  factory GetItemsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GetItemsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetItemsRequestModelToJson(this);
}

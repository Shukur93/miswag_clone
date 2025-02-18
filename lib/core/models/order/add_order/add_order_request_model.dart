// To parse this JSON data, do
//
//     final addOrderRequestModel = addOrderRequestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'add_order_request_model.g.dart';

List<AddOrderRequestModel> addOrderRequestModelFromJson(String str) =>
    List<AddOrderRequestModel>.from(
        json.decode(str).map((x) => AddOrderRequestModel.fromJson(x)));

String addOrderRequestModelToJson(List<AddOrderRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class AddOrderRequestModel {
  @JsonKey(name: "itemId")
  int itemId;
  @JsonKey(name: "quantity")
  int quantity;

  AddOrderRequestModel({
    required this.itemId,
    required this.quantity,
  });

  factory AddOrderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddOrderRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddOrderRequestModelToJson(this);
}


 // To parse this JSON data, do
// //
// //     final addOrderRequestModel = addOrderRequestModelFromJson(jsonString);

// import 'package:json_annotation/json_annotation.dart';

// part 'add_order_request_model.g.dart';

// @JsonSerializable()
// class AddOrderRequestModel {
//   @JsonKey(name: "LocationId")
//   int locationId;
//   @JsonKey(name: "Quantity")
//   int quantity;
//   @JsonKey(name: "Note")
//   String? note;
//   @JsonKey(name: "PayType")
//   int payType;

//   AddOrderRequestModel({
//     required this.locationId,
//     required this.quantity,
//     this.note,
//     required this.payType,
//   });

//   Map<String, dynamic> toJson() => _$AddOrderRequestModelToJson(this);
// }

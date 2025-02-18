// To parse this JSON data, do
//
//     final DeleteAccountResponseModel = DeleteAccountResponseModelFromJson(jsonString);

import 'package:miswag_clone/core/models/common_api/common_api_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_profile_response_model.g.dart';

@JsonSerializable()
class DeleteAccountResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  int? statusCode;
  @JsonKey(name: "StatusDescription")
  @override
  String? statusDescription;

  DeleteAccountResponseModel({
    this.statusCode,
    this.statusDescription,
  });

  factory DeleteAccountResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountResponseModelFromJson(json);
}

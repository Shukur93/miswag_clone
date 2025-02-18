// To parse this JSON data, do
//
//     final changeFpResponseModel = changeFpResponseModelFromJson(jsonString);

import 'package:miswag_clone/core/models/common_api/common_api_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_fp_response_model.g.dart';

@JsonSerializable()
class ChangeFpResponseModel implements CommonApiResponse {
  @JsonKey(name: "StatusCode")
  @override
  int? statusCode;
  @JsonKey(name: "StatusDescription")
  @override
  String? statusDescription;

  ChangeFpResponseModel({
    this.statusCode,
    this.statusDescription,
  });

  factory ChangeFpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChangeFpResponseModelFromJson(json);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
part 'forget_pass_req_model.g.dart';

@JsonSerializable()
class ForgetPasswordRequestModel {
  @JsonKey(name: 'PhoneNo')
  String phoneNo;
  ForgetPasswordRequestModel({
    required this.phoneNo,
  });

  // ToJson
  Map<String, dynamic> toJson() => _$ForgetPasswordRequestModelToJson(this);
}

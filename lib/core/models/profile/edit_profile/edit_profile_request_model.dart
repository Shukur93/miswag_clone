// To parse this JSON data, do
//
//     final editProfileRequestModel = editProfileRequestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request_model.g.dart';

@JsonSerializable()
class EditProfileRequestModel {
  @JsonKey(name: "PhoneNo")
  String phoneNo;
  @JsonKey(name: "FirstName")
  String firstName;
  @JsonKey(name: "LastName")
  String lastName;
  @JsonKey(name: "Email")
  String email;
  @JsonKey(name: "Governorate")
  int governorate;

  EditProfileRequestModel({
    required this.phoneNo,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.governorate,
  });

  Map<String, dynamic> toJson() => _$EditProfileRequestModelToJson(this);
}

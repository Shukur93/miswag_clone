// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequestModel _$EditProfileRequestModelFromJson(
        Map<String, dynamic> json) =>
    EditProfileRequestModel(
      phoneNo: json['PhoneNo'] as String,
      firstName: json['FirstName'] as String,
      lastName: json['LastName'] as String,
      email: json['Email'] as String,
      governorate: (json['Governorate'] as num).toInt(),
    );

Map<String, dynamic> _$EditProfileRequestModelToJson(
        EditProfileRequestModel instance) =>
    <String, dynamic>{
      'PhoneNo': instance.phoneNo,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'Email': instance.email,
      'Governorate': instance.governorate,
    };

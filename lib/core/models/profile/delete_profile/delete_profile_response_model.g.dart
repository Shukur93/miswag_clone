// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteAccountResponseModel _$DeleteAccountResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeleteAccountResponseModel(
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      statusDescription: json['StatusDescription'] as String?,
    );

Map<String, dynamic> _$DeleteAccountResponseModelToJson(
        DeleteAccountResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
    };

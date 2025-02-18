// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_fp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeFpResponseModel _$ChangeFpResponseModelFromJson(
        Map<String, dynamic> json) =>
    ChangeFpResponseModel(
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      statusDescription: json['StatusDescription'] as String?,
    );

Map<String, dynamic> _$ChangeFpResponseModelToJson(
        ChangeFpResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
    };

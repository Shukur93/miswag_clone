// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_notification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenNotificationResponseModel _$OpenNotificationResponseModelFromJson(
        Map<String, dynamic> json) =>
    OpenNotificationResponseModel(
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      statusDescription: json['StatusDescription'] as String?,
    );

Map<String, dynamic> _$OpenNotificationResponseModelToJson(
        OpenNotificationResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notifications_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNotificationsResponseModel _$GetNotificationsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetNotificationsResponseModel(
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      statusDescription: json['StatusDescription'] as String?,
      responseData: json['ResponseData'] == null
          ? null
          : ResponseData.fromJson(json['ResponseData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetNotificationsResponseModelToJson(
        GetNotificationsResponseModel instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusDescription': instance.statusDescription,
      'ResponseData': instance.responseData,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      data: (json['data'] as List<dynamic>)
          .map((e) => NotificationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    NotificationData(
      id: (json['ID'] as num?)?.toInt(),
      insertDate: json['INSERT_DATE'] as String?,
      lastUpdate: json['LAST_UPDATE'] as String?,
      tittle: json['TITTLE'] as String?,
      body: json['BODY'] as String?,
      orderId: (json['ORDER_ID'] as num?)?.toInt(),
      isReaded: json['IS_READED'] as bool?,
      isOpened: json['IS_OPENED'] as bool?,
      entityId: (json['ENTITY_ID'] as num?)?.toInt(),
      entityType: json['ENTITY_TYPE'] as String?,
    );

Map<String, dynamic> _$NotificationDataToJson(NotificationData instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'INSERT_DATE': instance.insertDate,
      'LAST_UPDATE': instance.lastUpdate,
      'TITTLE': instance.tittle,
      'BODY': instance.body,
      'ORDER_ID': instance.orderId,
      'IS_READED': instance.isReaded,
      'IS_OPENED': instance.isOpened,
      'ENTITY_ID': instance.entityId,
      'ENTITY_TYPE': instance.entityType,
    };

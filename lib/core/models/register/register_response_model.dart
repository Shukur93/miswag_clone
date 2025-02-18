import 'package:miswag_clone/core/models/common_api/common_api_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel implements CommonApiResponse {
  @JsonKey(name: 'StatusCode')
  @override
  int? statusCode;
  @JsonKey(name: 'StatusDescription')
  @override
  String? statusDescription;
  @JsonKey(name: 'ResponseData')
  ResponseData? responseData;

  RegisterResponseModel({
    this.statusCode,
    this.statusDescription,
    this.responseData,
  });

  // write from json to json serializer
  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
}

@JsonSerializable()
class ResponseData {
  @JsonKey(name: 'USER_ID')
  int? userId;
  @JsonKey(name: 'PHONE_NO')
  String? phoneNo;

  ResponseData({
    this.userId,
    this.phoneNo,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);
}

// class RegisterResponseModel implements CommonApiResponse {
//   int statusCode;
//   String statusDescription;
//   ResponseData responseData;

//   RegisterResponseModel({
//     required this.statusCode,
//     required this.statusDescription,
//     required this.responseData,
//   });

//   factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
//       RegisterResponseModel(
//         statusCode: json["StatusCode"],
//         statusDescription: json["StatusDescription"],
//         responseData: ResponseData.fromJson(json["ResponseData"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "StatusCode": statusCode,
//         "StatusDescription": statusDescription,
//         "ResponseData": responseData.toJson(),
//       };
// }

// class ResponseData {
//   int userId;
//   String phoneNo;

//   ResponseData({
//     required this.userId,
//     required this.phoneNo,
//   });

//   factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
//         userId: json["USER_ID"],
//         phoneNo: json["PHONE_NO"],
//       );

//   Map<String, dynamic> toJson() => {
//         "USER_ID": userId,
//         "PHONE_NO": phoneNo,
//       };
// }

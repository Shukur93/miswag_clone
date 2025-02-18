// To parse this JSON data, do
//
//     final commonApiResponse = commonApiResponseFromJson(jsonString);

abstract class CommonApiResponse {
  int? get statusCode;
  String? get statusDescription;
}

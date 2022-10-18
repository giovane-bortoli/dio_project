// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart' as dio;

class DioApiResponse {
  final int? statusCode;
  final dynamic data;
  DioApiResponse({
    this.statusCode,
    required this.data,
  });

  factory DioApiResponse.fromDioResponse(dio.Response response) {
    return DioApiResponse(data: response.data, statusCode: response.statusCode);
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart' as dio;

class ApiResponse {
  final int? statusCode;
  final dynamic data;
  ApiResponse({
    this.statusCode,
    required this.data,
  });

  factory ApiResponse.fromDioResponse(dio.Response response) {
    return ApiResponse(data: response.data, statusCode: response.statusCode);
  }
}

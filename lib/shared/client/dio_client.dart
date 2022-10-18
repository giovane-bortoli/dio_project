import 'package:dio_project/shared/client/dio_api_response.dart';

abstract class DioClient {
  Future<DioApiResponse> get(String path,
      {Map<String, String>? headers, Map<String, dynamic>? query});

  Future<DioApiResponse> post(String path,
      {Map<String, String>? headers, Map<String, dynamic>? query});
}

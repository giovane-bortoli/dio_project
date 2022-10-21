import 'package:dio_project/shared/client/api_response.dart';

abstract class Client {
  Future<ApiResponse> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });

  Future<ApiResponse> post({
    required String path,
    Map<String, String>? body,
    Map<String, dynamic>? query,
  });
}

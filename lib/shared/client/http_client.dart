import 'package:dio_project/shared/client/api_response.dart';
import 'package:dio_project/shared/client/client.dart';

class HttpImpl implements Client {
  @override
  Future<ApiResponse> get(String path,
      {Map<String, String>? headers, Map<String, dynamic>? query}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> post(
      {required String path,
      Map<String, String>? body,
      Map<String, dynamic>? query}) {
    // TODO: implement post
    throw UnimplementedError();
  }
}

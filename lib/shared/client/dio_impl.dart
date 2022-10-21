import 'package:dio/dio.dart';
import 'package:dio_project/shared/client/api_response.dart';
import 'package:dio_project/shared/client/client.dart';

class DioImpl implements Client {
  //final dio.Dio client = Dio();
  final Dio dio;

  DioImpl({required this.dio});

  @override
  Future<ApiResponse> get(String path,
      {Map<String, String>? headers, Map<String, dynamic>? query}) async {
    final response = await dio.get(path,
        queryParameters: query,
        options: Options(
          headers: headers,
          sendTimeout: 1000,
          receiveTimeout: 1000,
        ));

    return ApiResponse.fromDioResponse(response);
  }

  @override
  Future<ApiResponse> post(
      {required String path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? query}) async {
    final response = await dio.post(path,
        queryParameters: query,
        options: Options(
          headers: body,
          sendTimeout: 50000,
          receiveTimeout: 50000,
        ));

    return ApiResponse.fromDioResponse(response);
  }
}

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:dio_project/shared/client/dio_api_response.dart';
import 'package:dio_project/shared/client/dio_client.dart';

class DioImpl extends DioClient {
  final dio.Dio client = Dio();

  @override
  Future<DioApiResponse> get(String path,
      {Map<String, String>? headers, Map<String, dynamic>? query}) async {
    final response = await client.get(path,
        queryParameters: query,
        options: dio.Options(
          headers: headers,
          sendTimeout: 1000,
          receiveTimeout: 1000,
        ));

    return DioApiResponse.fromDioResponse(response);
  }

  @override
  Future<DioApiResponse> post(
      {required String path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? query}) async {
    final response = await client.post(path,
        queryParameters: query,
        options: dio.Options(
          headers: body,
          sendTimeout: 50000,
          receiveTimeout: 50000,
        ));

    return DioApiResponse.fromDioResponse(response);
  }
}

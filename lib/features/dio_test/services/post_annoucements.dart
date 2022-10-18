import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_project/features/dio_test/models/location_model.dart';
import 'package:dio_project/main.dart';
import 'package:dio_project/shared/client/dio_impl.dart';
import 'package:dio_project/shared/utils/app_configs.dart';

class PostAnnoucements {
  //TODO DÚVIDA, NESSE MÉTODO COMO PASSAR O AUTHORIZATION E TOKEN SE NECESSÁRIO
  final dio = Dio();
  // Future<List<PostAnnoucementsModel>> postAnnoucements() async {
  final client = getIt<DioImpl>();

  //   final response = await client.post('${AppConfigs.mockUrl}');
  //   if (response.statusCode == 200) {
  //     inspect(response);
  //     return List.from(response.data)
  //         .map((e) => PostAnnoucementsModel.fromJson(e))
  //         .toList();
  //   } else {
  //     throw Exception();
  //   }
  // }

  Future<void> postAnnoucements({
    String? title,
    String? description,
    int? annoucementType,
    String? expiresIn,
    String? files,
    String? salary,
    String? workArea,
    LocationModel? location,
  }) async {
    Map<String, dynamic> body = {};

    body.putIfAbsent('title', () => title);
    body.putIfAbsent('description', () => description);
    body.putIfAbsent('annoucementType', () => annoucementType);
    body.putIfAbsent('expiresIn', () => expiresIn);
    body.putIfAbsent('files', () => files);
    body.putIfAbsent('salary', () => salary);
    body.putIfAbsent('workArea', () => workArea);
    body.putIfAbsent('location', () => location);

    try {
      var form = FormData.fromMap(body);
      inspect(form);
      String uri = ('${AppConfigs.mockUrl}');
      await dio.post(
        uri,
        data: form,
      );
    } catch (_) {
      throw Exception();
    }
  }
}

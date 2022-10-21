import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_project/features/dio_test/models/location_model.dart';
import 'package:dio_project/features/dio_test/models/post_annoucements_model.dart';
import 'package:dio_project/main.dart';
import 'package:dio_project/shared/client/dio_impl.dart';
import 'package:dio_project/shared/client/errors/error_exceptions.dart';
import 'package:dio_project/shared/utils/app_configs.dart';

class PostAnnoucements {
  //TODO DÚVIDA, NESSE MÉTODO COMO PASSAR O AUTHORIZATION E TOKEN SE NECESSÁRIO E ENTENDER O ENVIO DO POST E QUAIS PARAMETROS DIFERENTES DO GET
  final dio = Dio();
  Future<PostAnnoucementsModel> postAnnoucements() async {
    final client = getIt<DioImpl>();
    final response = await client.post(path: '${AppConfigs.mockUrl}');
    try {
      inspect(response);
      return PostAnnoucementsModel.fromJson(response.data);
    } catch (_) {
      switch (response.statusCode) {
        case 404:
          throw NotFoundException();
        case 403:
          throw ForbiddenException();
        case 500:
          throw InternalServerException();
        default:
          throw GenericException();
      }
    }
  }
}

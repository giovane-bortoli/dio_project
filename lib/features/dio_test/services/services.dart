import 'dart:developer';

import 'package:dio_project/features/dio_test/models/annoucements_model.dart';
import 'package:dio_project/features/dio_test/models/post_annoucements_model.dart';
import 'package:dio_project/features/dio_test/services/services_interface.dart';
import 'package:dio_project/main.dart';
import 'package:dio_project/shared/client/dio_impl.dart';
import 'package:dio_project/shared/client/errors/error_exceptions.dart';
import 'package:dio_project/shared/utils/app_configs.dart';

class Services implements ServiceInterface {
  //final client = getIt<DioImpl>();

  final DioImpl client;

  Services({required this.client});

  @override
  Future<List<AnnoucementsModel>> getAnnoucements() async {
    final response = await client.get('${AppConfigs.baseUrl}/announcements');
    switch (response.statusCode) {
      case 200:
        return List.from(response.data)
            .map((e) => AnnoucementsModel.fromJson(e))
            .toList();
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

  @override
  Future<PostAnnoucementsModel> postAnnoucements() async {
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

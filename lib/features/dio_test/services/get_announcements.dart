import 'dart:developer';

import 'package:dio_project/features/dio_test/models/annoucements_model.dart';
import 'package:dio_project/main.dart';
import 'package:dio_project/shared/client/dio_impl.dart';
import 'package:dio_project/shared/utils/app_configs.dart';

class GetAnnoucements {
  Future<List<AnnoucementsModel>> getAnnoucements() async {
    final client = getIt<DioImpl>();
    final response = await client.get('${AppConfigs.baseUrl}/announcements');
    if (response.statusCode == 200) {
      inspect(response);
      return List.from(response.data)
          .map((e) => AnnoucementsModel.fromJson(e))
          .toList();
    } else {
      throw Exception();
    }
  }
}

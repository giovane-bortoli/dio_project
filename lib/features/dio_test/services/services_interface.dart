import 'package:dio_project/features/dio_test/models/annoucements_model.dart';
import 'package:dio_project/features/dio_test/models/post_annoucements_model.dart';

abstract class ServiceInterface {
  Future<List<AnnoucementsModel>> getAnnoucements();

  Future<PostAnnoucementsModel> postAnnoucements();
}

import 'package:dio_project/features/dio_test/models/annoucements_model.dart';

abstract class PrefsInterface {
  Future<void> saveData(List<AnnoucementsModel> annoucementModel);

  Future<List<AnnoucementsModel>> getData();

  Future<void> updateAnnouncement(AnnoucementsModel updated);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:dio_project/features/dio_test/models/annoucements_model.dart';
import 'package:dio_project/features/dio_test/services/prefs_interface.dart';
import 'package:dio_project/features/dio_test/services/storage_servce.dart';

class Prefs implements PrefsInterface {
  static const String annoucementsKey = 'annoucements';

  final StorageService prefs;
  Prefs({
    required this.prefs,
  });

  @override
  Future<List<AnnoucementsModel>> getData() async {
    final annoucementSerialized = prefs.getStringList(annoucementsKey);
    if (annoucementSerialized != null) {
      final getAnnoucementList = List<Map<String, dynamic>>.from(
          annoucementSerialized.map((e) => jsonDecode(e)));
      return getAnnoucementList.map(AnnoucementsModel.fromJson).toList();
    }
    return [];
  }

  @override
  Future<void> saveData(List<AnnoucementsModel> annoucementModel) async {
    final annoucementsList =
        annoucementModel.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(annoucementsKey, annoucementsList);
    inspect(annoucementsList);
  }

  @override
  Future<void> updateAnnouncement(AnnoucementsModel updated) async {
    final announcements = await getData();
    final updatedAnnouncements =
        announcements.map((a) => a.id == updated.id ? updated : a).toList();
    await saveData(updatedAnnouncements);
  }
}

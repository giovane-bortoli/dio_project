import 'dart:convert';
import 'dart:developer';

import 'package:dio_project/features/dio_test/models/annoucements_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const String annoucementsKey = 'annoucements';

  Future<void> saveData(List<AnnoucementsModel> annoucementModel) async {
    final prefs = await SharedPreferences.getInstance();
    final annoucementsList =
        annoucementModel.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(annoucementsKey, annoucementsList);
  }

  Future<List<AnnoucementsModel>> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final annoucementSerialized = prefs.getStringList(annoucementsKey);
    if (annoucementSerialized != null) {
      final getAnnoucementList = List<Map<String, dynamic>>.from(
          annoucementSerialized.map((e) => jsonDecode(e)));
      return getAnnoucementList.map(AnnoucementsModel.fromJson).toList();
    }
    return [];
  }
}

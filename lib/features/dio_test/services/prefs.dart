// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:dio_project/features/dio_test/models/annoucements_model.dart';

class Prefs {
  static const String annoucementsKey = 'annoucements';

  Future<void> saveData(List<AnnoucementsModel> annoucementModel) async {
    final prefs = await SharedPreferences.getInstance();
    final annoucementsList =
        annoucementModel.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(annoucementsKey, annoucementsList);
    inspect(annoucementsList);
  }

  //realizar tratamento de erro
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

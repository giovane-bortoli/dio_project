import 'dart:developer';

import 'package:dio_project/features/dio_test/services/get_announcements.dart';
import 'package:dio_project/features/dio_test/services/post_annoucements.dart';
import 'package:mobx/mobx.dart';
part 'annoucements_store.g.dart';

class AnnoucementStore = _AnnoucementStoreBase with _$AnnoucementStore;

abstract class _AnnoucementStoreBase with Store {
  final getService = GetAnnoucements();
  final postService = PostAnnoucements();

  Future<void> getAnnoucements() async {
    try {
      final result = await getService.getAnnoucements();
      inspect(result);
    } catch (_) {
      throw Exception();
    }
  }

  Future<void> postAnnoucements() async {
    try {
      final result = await postService.postAnnoucements();
      //inspect(result);
    } catch (_) {
      throw Exception();
    }
  }
}

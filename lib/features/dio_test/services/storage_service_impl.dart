// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio_project/features/dio_test/services/storage_servce.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServiceImpl implements StorageService {
  final SharedPreferences prefs;
  StorageServiceImpl({
    required this.prefs,
  });

  @override
  List<String>? getStringList(String key) {
    return prefs.getStringList(key);
  }

  @override
  Future<bool> setStringList(String key, List<String> value) {
    return prefs.setStringList(key, value);
  }
}

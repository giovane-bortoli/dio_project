abstract class StorageService {
  List<String>? getStringList(String key);

  Future<bool> setStringList(String key, List<String> value);
}

import 'package:dio_project/features/dio_test/models/annoucements_model.dart';
import 'package:dio_project/main.dart';
import 'package:dio_project/shared/client/dio_impl.dart';
import 'package:get_it/get_it.dart';

class AppDependencies {
  void setup() {
    getIt.registerSingleton<DioImpl>(DioImpl());
  }
}

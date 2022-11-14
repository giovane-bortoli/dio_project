import 'package:dio/dio.dart';
import 'package:dio_project/features/dio_test/controller/annoucements_store.dart';
import 'package:dio_project/features/dio_test/services/prefs.dart';
import 'package:dio_project/features/dio_test/services/prefs_interface.dart';
import 'package:dio_project/features/dio_test/services/services.dart';
import 'package:dio_project/features/dio_test/services/services_interface.dart';
import 'package:dio_project/features/dio_test/services/storage_servce.dart';
import 'package:dio_project/features/dio_test/services/storage_service_impl.dart';
import 'package:dio_project/main.dart';
import 'package:dio_project/shared/client/client.dart';
import 'package:dio_project/shared/client/dio_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());

  getIt.registerFactory<Dio>(() => Dio());

  getIt.registerFactory<StorageService>(() {
    return StorageServiceImpl(prefs: getIt.get<SharedPreferences>());
  });

  getIt.registerFactory<PrefsInterface>(() {
    return Prefs(prefs: getIt.get<StorageService>());
  });

  // getIt.registerFactory<PrefsInterface>(
  //     () => Prefs(prefs: getIt.get<StorageService>()));

  //implementação
  getIt.registerFactory<Client>(() => DioImpl(dio: getIt.get<Dio>()));
  //interface
  getIt.registerFactory<ServiceInterface>(
      () => Services(client: getIt.get<Client>()));

  getIt.registerFactory<AnnoucementStore>(() => AnnoucementStore(
      services: getIt.get<ServiceInterface>(),
      prefs: getIt.get<PrefsInterface>()));

  // prefs interface
}

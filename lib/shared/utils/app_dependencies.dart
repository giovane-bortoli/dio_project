import 'package:dio/dio.dart';
import 'package:dio_project/features/dio_test/controller/annoucements_store.dart';
import 'package:dio_project/features/dio_test/models/annoucements_model.dart';
import 'package:dio_project/features/dio_test/services/services.dart';
import 'package:dio_project/features/dio_test/services/services_interface.dart';
import 'package:dio_project/main.dart';
import 'package:dio_project/shared/client/client.dart';
import 'package:dio_project/shared/client/dio_impl.dart';
import 'package:dio_project/shared/client/http_client.dart';
import 'package:get_it/get_it.dart';

class AppDependencies {
  void setup() {
    getIt.registerFactory<Dio>(() => Dio());

    //implementação
    getIt.registerSingleton<Client>(DioImpl(dio: getIt.get<Dio>()));
    //interface
    getIt.registerSingleton<ServiceInterface>(
        Services(client: getIt.get<Client>()));

    getIt.registerSingleton<AnnoucementStore>(
        AnnoucementStore(services: getIt.get<ServiceInterface>()));
  }
}

import 'package:dio_project/dio_project_app.dart';
import 'package:dio_project/shared/utils/app_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLibraries();
  runApp(const MyApp());
}

Future<void> setupLibraries() async {
  //Dependencies
  setup();

  getIt.allReady();

  //enviroment var
  await dotenv.load(fileName: ".env");
}

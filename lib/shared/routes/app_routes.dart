import 'package:dio_project/features/dio_test/views/create_annoucement_view.dart';
import 'package:dio_project/features/dio_test/views/home_screen.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes(context) {
    return {
      '/home': (context) => const MyHomePage(),
      '/createAnnoucement': (context) => CreateAnnoucementView(),
    };
  }
}

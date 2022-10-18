import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppConfigs {
  static final String? baseUrl = dotenv.env['BASE_URL'];
  static final String? mockUrl = dotenv.env['MOCK_URL'];
}

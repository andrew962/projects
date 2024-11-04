import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get baseUrl {
    return dotenv.get('BASE_URL');
  }
}

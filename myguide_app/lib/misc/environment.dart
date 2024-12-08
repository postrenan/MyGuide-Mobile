import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName {
    return '.env';
  }

  static String get apiUrl {
    return dotenv.env['API_URL'] ?? 'API_URL not found';
  }
}

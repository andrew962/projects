import 'package:flutter/services.dart';

class ReadJson {
  late String path;
  static final ReadJson _singleton = ReadJson._();
  ReadJson._();
  factory ReadJson({required String path}) {
    _singleton.path = path;
    return _singleton;
  }
  static ReadJson get instance => ReadJson._singleton;

  Future<String> loadString({bool cache = true}) async {
    return await rootBundle.loadString(_singleton.path, cache: cache);
  }
}

import 'package:data/data.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

dependecies() {
  getIt.registerLazySingleton<Network>(
      () => Network(baseUrl: dotenv.get('BASE_URL')));
  getIt.registerLazySingleton<ReadJson>(
      () => ReadJson(path: dotenv.get('PATH_FLAGS_JSON')));
  getIt.registerLazySingleton<FlagGameRepository>(() => FlagGameRepository());
}

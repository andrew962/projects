import 'package:data/data.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import 'package:data/network/network.dart';

var getIt = GetIt.instance;

dependecies() {
  getIt.registerLazySingleton<Network>(
      () => Network(baseUrl: dotenv.get('BASE_URL')));
  getIt.registerLazySingleton<FlagGameRepository>(() => FlagGameRepository());
}

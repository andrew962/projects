import 'package:data/data.dart';
import 'package:data/network/network.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

void dependencies() {
  getIt.registerLazySingleton<Network>(
      () => Network(baseUrl: dotenv.get('BASE_URL')));
  getIt.registerLazySingleton<PokeRepository>(() => PokeRepository());
}

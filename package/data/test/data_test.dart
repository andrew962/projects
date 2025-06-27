import 'package:data/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  var getIt = GetIt.instance;

  setUp(() {
    getIt.registerSingleton<FlagGameRepository>(FlagGameRepository());
    // getIt.registerLazySingleton<ReadJson>(
    //     () => ReadJson(path: dotenv.get('PATH_FLAGS_JSON')));
  });

  test("Test Random Flags", () async {
    final flagGameRepository = GetIt.instance<FlagGameRepository>();
    var randomFlags = await flagGameRepository.getRandomFlags();
    expect(randomFlags.length, 3);
  });
}

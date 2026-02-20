import 'dart:convert';
import 'dart:math';

import 'package:data/data.dart';
import 'package:get_it/get_it.dart';

class FlagGameRepository {
  ReadJson readJson = GetIt.instance<ReadJson>();
  final List<int> jsonFlagsCount = List.generate(184, (index) => index + 1);

  void resetFlags() {
    jsonFlagsCount.clear();
    jsonFlagsCount.addAll(List.generate(184, (index) => index + 1));
  }

  Future<QuestionModel> newQuestion() async {
    var flags = await getRandomFlags();
    var flag = await getRandomFlag(flags);
    return QuestionModel(options: flags, correctAnswer: flag);
  }

  Future<List<FlagItemModel>> getFlags() async {
    String flagsEncode = await readJson.loadString(cache: true);
    var flagsDecode = jsonDecode(flagsEncode);
    return ApiResponseModel.fromJson(flagsDecode,
        (json) => FlagItemModel.fromJson(json as Map<String, dynamic>)).items;
  }

  Future<FlagItemModel> getRandomFlag(List<FlagItemModel> flags) async {
    flags.shuffle();
    return flags[Random().nextInt(3)];
  }

  Future<List<FlagItemModel>> getRandomFlags() async {
    List<FlagItemModel> randomFlags = [];
    List<FlagItemModel> flags = await getFlags();
    jsonFlagsCount.shuffle();
    for (var i in jsonFlagsCount.take(3).toList()) {
      randomFlags.add(flags[i > 0 ? i - 1 : i]);
    }
    return randomFlags;
  }
}

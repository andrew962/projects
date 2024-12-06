import 'package:data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final newGameProvider = FutureProvider<NewGameResponseModel>((ref) async {
  return newGame();
});

final newQuestionProvider =
    FutureProvider.family<ApiResponseModel<QuestionResponseModel>, String>(
        (ref, gameId) async {
  return newQuestion(gameId);
});

Future<NewGameResponseModel> newGame() async {
  final pokeRepository = GetIt.instance<FlagGameRepository>();
  return await pokeRepository.newGame();
}

Future<ApiResponseModel<QuestionResponseModel>> newQuestion(
    String gameId) async {
  final pokeRepository = GetIt.instance<FlagGameRepository>();
  var params = QuestionParamsModel(gameId: gameId);
  return await pokeRepository.newQuestion(params);
}

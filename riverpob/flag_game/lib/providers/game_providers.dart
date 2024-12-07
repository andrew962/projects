import 'package:data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

// class GameNotifier extends StateNotifier<NewGameResponseModel> {
//   GameNotifier() : super(NewGameResponseModel());
//   newGame() async {
//     final pokeRepository = GetIt.instance<FlagGameRepository>();
//     state = await pokeRepository.newGame();
//   }
// }

// final gameProvider =
//     StateNotifierProvider<GameNotifier, NewGameResponseModel>((ref) {
//   return GameNotifier();
// });

final gameProvider =
    FutureProvider.autoDispose<NewGameResponseModel>((ref) async {
  return newGame();
});

final newQuestionProvider =
    FutureProvider.family<QuestionResponseModel, String>((ref, gameId) async {
  return newQuestion(gameId);
});

final deleteGameProvider =
    FutureProvider.family<bool, String>((ref, gameId) async {
  return deleteGame(gameId);
});

final gameStateProvider = StateProvider<NewGameResponseModel>((ref) {
  return NewGameResponseModel();
});

Future<NewGameResponseModel> newGame() async {
  final pokeRepository = GetIt.instance<FlagGameRepository>();
  return await pokeRepository.newGame();
}

Future<QuestionResponseModel> newQuestion(String gameId) async {
  final pokeRepository = GetIt.instance<FlagGameRepository>();
  var params = QuestionParamsModel(gameId: gameId);
  return await pokeRepository.newQuestion(params);
}

Future<bool> deleteGame(String gameId) async {
  final pokeRepository = GetIt.instance<FlagGameRepository>();
  var params = QuestionParamsModel(gameId: gameId);
  return await pokeRepository.deleteGame(params);
}

import 'package:data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

// class GameNotifier extends StateNotifier<NewGameItemResponseModel> {
//   GameNotifier() : super(NewGameItemResponseModel());
//   void currentGame(NewGameItemResponseModel game) async {
//     state = game;
//   }

//   void decrementLives() {
//     state = state.copyWith(lives: state.lives - 1);
//   }
// }

// final gameProvider =
//     StateNotifierProvider<GameNotifier, NewGameItemResponseModel>((ref) {
//   return GameNotifier();
// });

// final gameFutureProvider =
//     FutureProvider.autoDispose<NewGameItemResponseModel>((ref) async {
//   return newGame();
// });

// final newQuestionFutureProvider =
//     FutureProvider.family<QuestionResponseModel, String>((ref, gameId) async {
//   return QuestionResponseModel();
// });

// final deleteGameFutureProvider =
//     FutureProvider.family<bool, String>((ref, gameId) async {
//   return deleteGame(gameId);
// });

// final gameStateProvider = StateProvider<NewGameResponseModel>((ref) {
//   return NewGameResponseModel();
// });

// Future<NewGameItemResponseModel> newGame() async {
//   final pokeRepository = GetIt.instance<FlagGameRepository>();
//   return await pokeRepository.newGame();
// }

// Future<QuestionResponseModel> newQuestion(String gameId) async {
//   final pokeRepository = GetIt.instance<FlagGameRepository>();
//   var params = QuestionParamsModel(gameId: gameId);
//   return await pokeRepository.newQuestion(params);
// }

// Future<bool> deleteGame(String gameId) async {
//   final pokeRepository = GetIt.instance<FlagGameRepository>();
//   var params = QuestionParamsModel(gameId: gameId);
//   return await pokeRepository.deleteGame(params);
// }

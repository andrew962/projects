import 'package:data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final pokeRepository = GetIt.instance<FlagGameRepository>();
final newGameProvider =
    FutureProvider.autoDispose<QuestionResponseModel>((ref) async {
  final newGame = await pokeRepository.newGame();
  final newQuestion = await pokeRepository
      .newQuestion(QuestionParamsModel(gameId: newGame.item!.gameId));
  return newQuestion.item!;
});

final newGameDataProvider =
    StateProvider.autoDispose<NewGameItemResponseModel?>((ref) {
  return NewGameItemResponseModel(gameId: '', lives: 0);
});

import 'package:data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreCacheQuestionNotifier extends StateNotifier<QuestionModel> {
  PreCacheQuestionNotifier()
    : super(QuestionModel(correctAnswer: FlagItemModel()));
  void question(QuestionModel question) => state = question;
}

final preCacheQuestionProvider =
    StateNotifierProvider<PreCacheQuestionNotifier, QuestionModel>((ref) {
      return PreCacheQuestionNotifier();
    });

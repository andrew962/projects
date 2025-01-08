import 'package:data/data.dart';
import 'package:get_it/get_it.dart';

class GameService {
  final flagGameRepository = GetIt.instance<FlagGameRepository>();
  Future<QuestionResponseModel> newQuestion(QuestionParamsModel params) async {
    final newQuestion = await flagGameRepository.newQuestion(params);
    return newQuestion;
  }
}

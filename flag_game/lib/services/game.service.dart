import 'package:data/data.dart';
import 'package:get_it/get_it.dart';

class GameService {
  final _flagGameRepository = GetIt.instance<FlagGameRepository>();
  Future<QuestionModel> newQuestion() async {
    return _flagGameRepository.newQuestion();
  }

  void deleteFlagID(int flagID) {
    _flagGameRepository.jsonFlagsCount.remove(flagID);
  }
}

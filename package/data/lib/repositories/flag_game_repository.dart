import 'package:data/models/models.dart';
import 'package:data/network/network.dart';
import 'package:data/repositories/repository.dart';
import 'package:get_it/get_it.dart';

class FlagGameRepository implements Repository {
  @override
  Network network = GetIt.instance<Network>();

  Future<NewGameResponseModel> newGame() async {
    var r = await network.post('/new-game');
    return r.maybeWhen(
        ok: (data) {
          var newGame = NewGameResponseModel.fromJson(data);
          return newGame;
        },
        err: (err) =>
            NewGameResponseModel(message: 'Bad Request', success: false),
        orElse: () =>
            NewGameResponseModel(message: 'Server Error', success: false));
  }

  Future<ApiResponseModel<QuestionResponseModel>> newQuestion(
      QuestionParamsModel params) async {
    var response =
        await network.get('/new-question', queryParameters: params.toJson());
    return response.maybeWhen(
      ok: (data) {
        ApiResponseModel<QuestionResponseModel> r =
            ApiResponseModel<QuestionResponseModel>.fromJson(
                data,
                (json) => QuestionResponseModel.fromJson(
                    json as Map<String, dynamic>));
        return r;
      },
      err: (err) => ApiResponseModel(message: 'Bad Request', success: false),
      orElse: () => ApiResponseModel(message: 'Server Error', success: false),
    );
  }
}

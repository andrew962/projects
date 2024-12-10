import 'package:data/models/models.dart';
import 'package:data/network/network.dart';
import 'package:data/repositories/repository.dart';
import 'package:get_it/get_it.dart';

class FlagGameRepository implements Repository {
  @override
  Network network = GetIt.instance<Network>();

  Future<NewGameItemResponseModel> newGame() async {
    var r = await network.post('/new-game');
    return r.maybeWhen(
        ok: (data) {
          // var newGame = NewGameResponseModel.fromJson(data);
          ApiResponseModel<NewGameItemResponseModel> r =
              ApiResponseModel<NewGameItemResponseModel>.fromJson(
                  data,
                  (json) => NewGameItemResponseModel.fromJson(
                      json as Map<String, dynamic>));
          return r.item!;
        },
        err: (err) => NewGameItemResponseModel(),
        orElse: () => NewGameItemResponseModel());
  }

  Future<QuestionResponseModel> newQuestion(QuestionParamsModel params) async {
    var response =
        await network.get('/new-question', queryParameters: params.toJson());
    return response.maybeWhen(
      ok: (data) {
        ApiResponseModel<QuestionResponseModel> r =
            ApiResponseModel<QuestionResponseModel>.fromJson(
                data,
                (json) => QuestionResponseModel.fromJson(
                    json as Map<String, dynamic>));
        return r.item!;
      },
      err: (err) => QuestionResponseModel(
          answers: [],
          correctAnswer: '',
          country: CountryItemModel(countryName: '', urlImage: '', id: ''),
          gameId: '',
          questionId: ''),
      orElse: () => QuestionResponseModel(
          answers: [],
          correctAnswer: '',
          country: CountryItemModel(countryName: '', urlImage: '', id: ''),
          gameId: '',
          questionId: ''),
    );
  }

  Future<bool> deleteGame(QuestionParamsModel params) async {
    var r = await network.delete('/delete-game');
    return r.maybeWhen(
        ok: (data) {
          ApiResponseModel<GameDeletedModel> r =
              ApiResponseModel<GameDeletedModel>.fromJson(
                  data,
                  (json) =>
                      GameDeletedModel.fromJson(json as Map<String, dynamic>));
          return r.success;
        },
        err: (err) => false,
        orElse: () => false);
  }
}

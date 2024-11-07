// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuestionResponseModel _$QuestionResponseModelFromJson(
    Map<String, dynamic> json) {
  return _QuestionResponseModel.fromJson(json);
}

/// @nodoc
mixin _$QuestionResponseModel {
  @JsonKey(name: "game_id")
  String get gameId => throw _privateConstructorUsedError;
  @JsonKey(name: "question_id")
  String get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: "country")
  CountryItemModel get country => throw _privateConstructorUsedError;
  @JsonKey(name: "correct_answer")
  String get correctAnswer => throw _privateConstructorUsedError;
  @JsonKey(name: "answers")
  List<CountryItemModel> get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionResponseModelCopyWith<QuestionResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionResponseModelCopyWith<$Res> {
  factory $QuestionResponseModelCopyWith(QuestionResponseModel value,
          $Res Function(QuestionResponseModel) then) =
      _$QuestionResponseModelCopyWithImpl<$Res, QuestionResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "game_id") String gameId,
      @JsonKey(name: "question_id") String questionId,
      @JsonKey(name: "country") CountryItemModel country,
      @JsonKey(name: "correct_answer") String correctAnswer,
      @JsonKey(name: "answers") List<CountryItemModel> answers});

  $CountryItemModelCopyWith<$Res> get country;
}

/// @nodoc
class _$QuestionResponseModelCopyWithImpl<$Res,
        $Val extends QuestionResponseModel>
    implements $QuestionResponseModelCopyWith<$Res> {
  _$QuestionResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? questionId = null,
    Object? country = null,
    Object? correctAnswer = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as CountryItemModel,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<CountryItemModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CountryItemModelCopyWith<$Res> get country {
    return $CountryItemModelCopyWith<$Res>(_value.country, (value) {
      return _then(_value.copyWith(country: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuestionResponseModelImplCopyWith<$Res>
    implements $QuestionResponseModelCopyWith<$Res> {
  factory _$$QuestionResponseModelImplCopyWith(
          _$QuestionResponseModelImpl value,
          $Res Function(_$QuestionResponseModelImpl) then) =
      __$$QuestionResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "game_id") String gameId,
      @JsonKey(name: "question_id") String questionId,
      @JsonKey(name: "country") CountryItemModel country,
      @JsonKey(name: "correct_answer") String correctAnswer,
      @JsonKey(name: "answers") List<CountryItemModel> answers});

  @override
  $CountryItemModelCopyWith<$Res> get country;
}

/// @nodoc
class __$$QuestionResponseModelImplCopyWithImpl<$Res>
    extends _$QuestionResponseModelCopyWithImpl<$Res,
        _$QuestionResponseModelImpl>
    implements _$$QuestionResponseModelImplCopyWith<$Res> {
  __$$QuestionResponseModelImplCopyWithImpl(_$QuestionResponseModelImpl _value,
      $Res Function(_$QuestionResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? questionId = null,
    Object? country = null,
    Object? correctAnswer = null,
    Object? answers = null,
  }) {
    return _then(_$QuestionResponseModelImpl(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as CountryItemModel,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<CountryItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionResponseModelImpl implements _QuestionResponseModel {
  _$QuestionResponseModelImpl(
      {@JsonKey(name: "game_id") required this.gameId,
      @JsonKey(name: "question_id") required this.questionId,
      @JsonKey(name: "country") required this.country,
      @JsonKey(name: "correct_answer") required this.correctAnswer,
      @JsonKey(name: "answers") required final List<CountryItemModel> answers})
      : _answers = answers;

  factory _$QuestionResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "game_id")
  final String gameId;
  @override
  @JsonKey(name: "question_id")
  final String questionId;
  @override
  @JsonKey(name: "country")
  final CountryItemModel country;
  @override
  @JsonKey(name: "correct_answer")
  final String correctAnswer;
  final List<CountryItemModel> _answers;
  @override
  @JsonKey(name: "answers")
  List<CountryItemModel> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'QuestionResponseModel(gameId: $gameId, questionId: $questionId, country: $country, correctAnswer: $correctAnswer, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionResponseModelImpl &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gameId, questionId, country,
      correctAnswer, const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionResponseModelImplCopyWith<_$QuestionResponseModelImpl>
      get copyWith => __$$QuestionResponseModelImplCopyWithImpl<
          _$QuestionResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionResponseModelImplToJson(
      this,
    );
  }
}

abstract class _QuestionResponseModel implements QuestionResponseModel {
  factory _QuestionResponseModel(
          {@JsonKey(name: "game_id") required final String gameId,
          @JsonKey(name: "question_id") required final String questionId,
          @JsonKey(name: "country") required final CountryItemModel country,
          @JsonKey(name: "correct_answer") required final String correctAnswer,
          @JsonKey(name: "answers")
          required final List<CountryItemModel> answers}) =
      _$QuestionResponseModelImpl;

  factory _QuestionResponseModel.fromJson(Map<String, dynamic> json) =
      _$QuestionResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "game_id")
  String get gameId;
  @override
  @JsonKey(name: "question_id")
  String get questionId;
  @override
  @JsonKey(name: "country")
  CountryItemModel get country;
  @override
  @JsonKey(name: "correct_answer")
  String get correctAnswer;
  @override
  @JsonKey(name: "answers")
  List<CountryItemModel> get answers;
  @override
  @JsonKey(ignore: true)
  _$$QuestionResponseModelImplCopyWith<_$QuestionResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

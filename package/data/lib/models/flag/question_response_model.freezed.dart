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
  @JsonKey(name: "correct_answer")
  CountryItemModel? get correctAnswer => throw _privateConstructorUsedError;
  @JsonKey(name: "questions")
  List<CountryItemModel>? get questions => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "correct_answer") CountryItemModel? correctAnswer,
      @JsonKey(name: "questions") List<CountryItemModel>? questions});

  $CountryItemModelCopyWith<$Res>? get correctAnswer;
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
    Object? correctAnswer = freezed,
    Object? questions = freezed,
  }) {
    return _then(_value.copyWith(
      correctAnswer: freezed == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as CountryItemModel?,
      questions: freezed == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<CountryItemModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CountryItemModelCopyWith<$Res>? get correctAnswer {
    if (_value.correctAnswer == null) {
      return null;
    }

    return $CountryItemModelCopyWith<$Res>(_value.correctAnswer!, (value) {
      return _then(_value.copyWith(correctAnswer: value) as $Val);
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
      {@JsonKey(name: "correct_answer") CountryItemModel? correctAnswer,
      @JsonKey(name: "questions") List<CountryItemModel>? questions});

  @override
  $CountryItemModelCopyWith<$Res>? get correctAnswer;
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
    Object? correctAnswer = freezed,
    Object? questions = freezed,
  }) {
    return _then(_$QuestionResponseModelImpl(
      correctAnswer: freezed == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as CountryItemModel?,
      questions: freezed == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<CountryItemModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionResponseModelImpl implements _QuestionResponseModel {
  _$QuestionResponseModelImpl(
      {@JsonKey(name: "correct_answer") this.correctAnswer,
      @JsonKey(name: "questions") final List<CountryItemModel>? questions})
      : _questions = questions;

  factory _$QuestionResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "correct_answer")
  final CountryItemModel? correctAnswer;
  final List<CountryItemModel>? _questions;
  @override
  @JsonKey(name: "questions")
  List<CountryItemModel>? get questions {
    final value = _questions;
    if (value == null) return null;
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QuestionResponseModel(correctAnswer: $correctAnswer, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionResponseModelImpl &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, correctAnswer,
      const DeepCollectionEquality().hash(_questions));

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
      {@JsonKey(name: "correct_answer") final CountryItemModel? correctAnswer,
      @JsonKey(name: "questions")
      final List<CountryItemModel>? questions}) = _$QuestionResponseModelImpl;

  factory _QuestionResponseModel.fromJson(Map<String, dynamic> json) =
      _$QuestionResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "correct_answer")
  CountryItemModel? get correctAnswer;
  @override
  @JsonKey(name: "questions")
  List<CountryItemModel>? get questions;
  @override
  @JsonKey(ignore: true)
  _$$QuestionResponseModelImplCopyWith<_$QuestionResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

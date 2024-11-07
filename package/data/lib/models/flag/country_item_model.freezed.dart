// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CountryItemModel _$CountryItemModelFromJson(Map<String, dynamic> json) {
  return _CountryItemModel.fromJson(json);
}

/// @nodoc
mixin _$CountryItemModel {
  @JsonKey(name: "url_image")
  String? get urlImage => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "country_name")
  String get countryName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryItemModelCopyWith<CountryItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryItemModelCopyWith<$Res> {
  factory $CountryItemModelCopyWith(
          CountryItemModel value, $Res Function(CountryItemModel) then) =
      _$CountryItemModelCopyWithImpl<$Res, CountryItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "url_image") String? urlImage,
      String id,
      @JsonKey(name: "country_name") String countryName});
}

/// @nodoc
class _$CountryItemModelCopyWithImpl<$Res, $Val extends CountryItemModel>
    implements $CountryItemModelCopyWith<$Res> {
  _$CountryItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urlImage = freezed,
    Object? id = null,
    Object? countryName = null,
  }) {
    return _then(_value.copyWith(
      urlImage: freezed == urlImage
          ? _value.urlImage
          : urlImage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryItemModelImplCopyWith<$Res>
    implements $CountryItemModelCopyWith<$Res> {
  factory _$$CountryItemModelImplCopyWith(_$CountryItemModelImpl value,
          $Res Function(_$CountryItemModelImpl) then) =
      __$$CountryItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "url_image") String? urlImage,
      String id,
      @JsonKey(name: "country_name") String countryName});
}

/// @nodoc
class __$$CountryItemModelImplCopyWithImpl<$Res>
    extends _$CountryItemModelCopyWithImpl<$Res, _$CountryItemModelImpl>
    implements _$$CountryItemModelImplCopyWith<$Res> {
  __$$CountryItemModelImplCopyWithImpl(_$CountryItemModelImpl _value,
      $Res Function(_$CountryItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urlImage = freezed,
    Object? id = null,
    Object? countryName = null,
  }) {
    return _then(_$CountryItemModelImpl(
      urlImage: freezed == urlImage
          ? _value.urlImage
          : urlImage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryItemModelImpl implements _CountryItemModel {
  _$CountryItemModelImpl(
      {@JsonKey(name: "url_image") this.urlImage,
      required this.id,
      @JsonKey(name: "country_name") required this.countryName});

  factory _$CountryItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryItemModelImplFromJson(json);

  @override
  @JsonKey(name: "url_image")
  final String? urlImage;
  @override
  final String id;
  @override
  @JsonKey(name: "country_name")
  final String countryName;

  @override
  String toString() {
    return 'CountryItemModel(urlImage: $urlImage, id: $id, countryName: $countryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryItemModelImpl &&
            (identical(other.urlImage, urlImage) ||
                other.urlImage == urlImage) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, urlImage, id, countryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryItemModelImplCopyWith<_$CountryItemModelImpl> get copyWith =>
      __$$CountryItemModelImplCopyWithImpl<_$CountryItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryItemModelImplToJson(
      this,
    );
  }
}

abstract class _CountryItemModel implements CountryItemModel {
  factory _CountryItemModel(
          {@JsonKey(name: "url_image") final String? urlImage,
          required final String id,
          @JsonKey(name: "country_name") required final String countryName}) =
      _$CountryItemModelImpl;

  factory _CountryItemModel.fromJson(Map<String, dynamic> json) =
      _$CountryItemModelImpl.fromJson;

  @override
  @JsonKey(name: "url_image")
  String? get urlImage;
  @override
  String get id;
  @override
  @JsonKey(name: "country_name")
  String get countryName;
  @override
  @JsonKey(ignore: true)
  _$$CountryItemModelImplCopyWith<_$CountryItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

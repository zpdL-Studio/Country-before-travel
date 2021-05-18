// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'country_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryCodeResponse _$CountryCodeResponseFromJson(Map<String, dynamic> json) {
  return _CountryCodeResponse.fromJson(json);
}

/// @nodoc
class _$CountryCodeResponseTearOff {
  const _$CountryCodeResponseTearOff();

  _CountryCodeResponse call(
      {required int totalCount,
      required int currentCount,
      required int numOfRows,
      required int pageNo,
      required List<CountryCodeModel> data}) {
    return _CountryCodeResponse(
      totalCount: totalCount,
      currentCount: currentCount,
      numOfRows: numOfRows,
      pageNo: pageNo,
      data: data,
    );
  }

  CountryCodeResponse fromJson(Map<String, Object> json) {
    return CountryCodeResponse.fromJson(json);
  }
}

/// @nodoc
const $CountryCodeResponse = _$CountryCodeResponseTearOff();

/// @nodoc
mixin _$CountryCodeResponse {
  int get totalCount => throw _privateConstructorUsedError;
  int get currentCount => throw _privateConstructorUsedError;
  int get numOfRows => throw _privateConstructorUsedError;
  int get pageNo => throw _privateConstructorUsedError;
  List<CountryCodeModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCodeResponseCopyWith<CountryCodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCodeResponseCopyWith<$Res> {
  factory $CountryCodeResponseCopyWith(
          CountryCodeResponse value, $Res Function(CountryCodeResponse) then) =
      _$CountryCodeResponseCopyWithImpl<$Res>;
  $Res call(
      {int totalCount,
      int currentCount,
      int numOfRows,
      int pageNo,
      List<CountryCodeModel> data});
}

/// @nodoc
class _$CountryCodeResponseCopyWithImpl<$Res>
    implements $CountryCodeResponseCopyWith<$Res> {
  _$CountryCodeResponseCopyWithImpl(this._value, this._then);

  final CountryCodeResponse _value;
  // ignore: unused_field
  final $Res Function(CountryCodeResponse) _then;

  @override
  $Res call({
    Object? totalCount = freezed,
    Object? currentCount = freezed,
    Object? numOfRows = freezed,
    Object? pageNo = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentCount: currentCount == freezed
          ? _value.currentCount
          : currentCount // ignore: cast_nullable_to_non_nullable
              as int,
      numOfRows: numOfRows == freezed
          ? _value.numOfRows
          : numOfRows // ignore: cast_nullable_to_non_nullable
              as int,
      pageNo: pageNo == freezed
          ? _value.pageNo
          : pageNo // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CountryCodeModel>,
    ));
  }
}

/// @nodoc
abstract class _$CountryCodeResponseCopyWith<$Res>
    implements $CountryCodeResponseCopyWith<$Res> {
  factory _$CountryCodeResponseCopyWith(_CountryCodeResponse value,
          $Res Function(_CountryCodeResponse) then) =
      __$CountryCodeResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int totalCount,
      int currentCount,
      int numOfRows,
      int pageNo,
      List<CountryCodeModel> data});
}

/// @nodoc
class __$CountryCodeResponseCopyWithImpl<$Res>
    extends _$CountryCodeResponseCopyWithImpl<$Res>
    implements _$CountryCodeResponseCopyWith<$Res> {
  __$CountryCodeResponseCopyWithImpl(
      _CountryCodeResponse _value, $Res Function(_CountryCodeResponse) _then)
      : super(_value, (v) => _then(v as _CountryCodeResponse));

  @override
  _CountryCodeResponse get _value => super._value as _CountryCodeResponse;

  @override
  $Res call({
    Object? totalCount = freezed,
    Object? currentCount = freezed,
    Object? numOfRows = freezed,
    Object? pageNo = freezed,
    Object? data = freezed,
  }) {
    return _then(_CountryCodeResponse(
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      currentCount: currentCount == freezed
          ? _value.currentCount
          : currentCount // ignore: cast_nullable_to_non_nullable
              as int,
      numOfRows: numOfRows == freezed
          ? _value.numOfRows
          : numOfRows // ignore: cast_nullable_to_non_nullable
              as int,
      pageNo: pageNo == freezed
          ? _value.pageNo
          : pageNo // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CountryCodeModel>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CountryCodeResponse implements _CountryCodeResponse {
  _$_CountryCodeResponse(
      {required this.totalCount,
      required this.currentCount,
      required this.numOfRows,
      required this.pageNo,
      required this.data});

  factory _$_CountryCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_CountryCodeResponseFromJson(json);

  @override
  final int totalCount;
  @override
  final int currentCount;
  @override
  final int numOfRows;
  @override
  final int pageNo;
  @override
  final List<CountryCodeModel> data;

  @override
  String toString() {
    return 'CountryCodeResponse(totalCount: $totalCount, currentCount: $currentCount, numOfRows: $numOfRows, pageNo: $pageNo, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CountryCodeResponse &&
            (identical(other.totalCount, totalCount) ||
                const DeepCollectionEquality()
                    .equals(other.totalCount, totalCount)) &&
            (identical(other.currentCount, currentCount) ||
                const DeepCollectionEquality()
                    .equals(other.currentCount, currentCount)) &&
            (identical(other.numOfRows, numOfRows) ||
                const DeepCollectionEquality()
                    .equals(other.numOfRows, numOfRows)) &&
            (identical(other.pageNo, pageNo) ||
                const DeepCollectionEquality().equals(other.pageNo, pageNo)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(totalCount) ^
      const DeepCollectionEquality().hash(currentCount) ^
      const DeepCollectionEquality().hash(numOfRows) ^
      const DeepCollectionEquality().hash(pageNo) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$CountryCodeResponseCopyWith<_CountryCodeResponse> get copyWith =>
      __$CountryCodeResponseCopyWithImpl<_CountryCodeResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CountryCodeResponseToJson(this);
  }
}

abstract class _CountryCodeResponse implements CountryCodeResponse {
  factory _CountryCodeResponse(
      {required int totalCount,
      required int currentCount,
      required int numOfRows,
      required int pageNo,
      required List<CountryCodeModel> data}) = _$_CountryCodeResponse;

  factory _CountryCodeResponse.fromJson(Map<String, dynamic> json) =
      _$_CountryCodeResponse.fromJson;

  @override
  int get totalCount => throw _privateConstructorUsedError;
  @override
  int get currentCount => throw _privateConstructorUsedError;
  @override
  int get numOfRows => throw _privateConstructorUsedError;
  @override
  int get pageNo => throw _privateConstructorUsedError;
  @override
  List<CountryCodeModel> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CountryCodeResponseCopyWith<_CountryCodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

CountryCodeModel _$CountryCodeModelFromJson(Map<String, dynamic> json) {
  return _CountryCodeModel.fromJson(json);
}

/// @nodoc
class _$CountryCodeModelTearOff {
  const _$CountryCodeModelTearOff();

  _CountryCodeModel call(
      {required String country_eng_nm,
      required String country_nm,
      required String country_iso_alp2,
      required String iso_alp3,
      String? iso_num}) {
    return _CountryCodeModel(
      country_eng_nm: country_eng_nm,
      country_nm: country_nm,
      country_iso_alp2: country_iso_alp2,
      iso_alp3: iso_alp3,
      iso_num: iso_num,
    );
  }

  CountryCodeModel fromJson(Map<String, Object> json) {
    return CountryCodeModel.fromJson(json);
  }
}

/// @nodoc
const $CountryCodeModel = _$CountryCodeModelTearOff();

/// @nodoc
mixin _$CountryCodeModel {
  String get country_eng_nm => throw _privateConstructorUsedError;
  String get country_nm => throw _privateConstructorUsedError;
  String get country_iso_alp2 => throw _privateConstructorUsedError;
  String get iso_alp3 => throw _privateConstructorUsedError;
  String? get iso_num => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCodeModelCopyWith<CountryCodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCodeModelCopyWith<$Res> {
  factory $CountryCodeModelCopyWith(
          CountryCodeModel value, $Res Function(CountryCodeModel) then) =
      _$CountryCodeModelCopyWithImpl<$Res>;
  $Res call(
      {String country_eng_nm,
      String country_nm,
      String country_iso_alp2,
      String iso_alp3,
      String? iso_num});
}

/// @nodoc
class _$CountryCodeModelCopyWithImpl<$Res>
    implements $CountryCodeModelCopyWith<$Res> {
  _$CountryCodeModelCopyWithImpl(this._value, this._then);

  final CountryCodeModel _value;
  // ignore: unused_field
  final $Res Function(CountryCodeModel) _then;

  @override
  $Res call({
    Object? country_eng_nm = freezed,
    Object? country_nm = freezed,
    Object? country_iso_alp2 = freezed,
    Object? iso_alp3 = freezed,
    Object? iso_num = freezed,
  }) {
    return _then(_value.copyWith(
      country_eng_nm: country_eng_nm == freezed
          ? _value.country_eng_nm
          : country_eng_nm // ignore: cast_nullable_to_non_nullable
              as String,
      country_nm: country_nm == freezed
          ? _value.country_nm
          : country_nm // ignore: cast_nullable_to_non_nullable
              as String,
      country_iso_alp2: country_iso_alp2 == freezed
          ? _value.country_iso_alp2
          : country_iso_alp2 // ignore: cast_nullable_to_non_nullable
              as String,
      iso_alp3: iso_alp3 == freezed
          ? _value.iso_alp3
          : iso_alp3 // ignore: cast_nullable_to_non_nullable
              as String,
      iso_num: iso_num == freezed
          ? _value.iso_num
          : iso_num // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CountryCodeModelCopyWith<$Res>
    implements $CountryCodeModelCopyWith<$Res> {
  factory _$CountryCodeModelCopyWith(
          _CountryCodeModel value, $Res Function(_CountryCodeModel) then) =
      __$CountryCodeModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String country_eng_nm,
      String country_nm,
      String country_iso_alp2,
      String iso_alp3,
      String? iso_num});
}

/// @nodoc
class __$CountryCodeModelCopyWithImpl<$Res>
    extends _$CountryCodeModelCopyWithImpl<$Res>
    implements _$CountryCodeModelCopyWith<$Res> {
  __$CountryCodeModelCopyWithImpl(
      _CountryCodeModel _value, $Res Function(_CountryCodeModel) _then)
      : super(_value, (v) => _then(v as _CountryCodeModel));

  @override
  _CountryCodeModel get _value => super._value as _CountryCodeModel;

  @override
  $Res call({
    Object? country_eng_nm = freezed,
    Object? country_nm = freezed,
    Object? country_iso_alp2 = freezed,
    Object? iso_alp3 = freezed,
    Object? iso_num = freezed,
  }) {
    return _then(_CountryCodeModel(
      country_eng_nm: country_eng_nm == freezed
          ? _value.country_eng_nm
          : country_eng_nm // ignore: cast_nullable_to_non_nullable
              as String,
      country_nm: country_nm == freezed
          ? _value.country_nm
          : country_nm // ignore: cast_nullable_to_non_nullable
              as String,
      country_iso_alp2: country_iso_alp2 == freezed
          ? _value.country_iso_alp2
          : country_iso_alp2 // ignore: cast_nullable_to_non_nullable
              as String,
      iso_alp3: iso_alp3 == freezed
          ? _value.iso_alp3
          : iso_alp3 // ignore: cast_nullable_to_non_nullable
              as String,
      iso_num: iso_num == freezed
          ? _value.iso_num
          : iso_num // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CountryCodeModel implements _CountryCodeModel {
  _$_CountryCodeModel(
      {required this.country_eng_nm,
      required this.country_nm,
      required this.country_iso_alp2,
      required this.iso_alp3,
      this.iso_num});

  factory _$_CountryCodeModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CountryCodeModelFromJson(json);

  @override
  final String country_eng_nm;
  @override
  final String country_nm;
  @override
  final String country_iso_alp2;
  @override
  final String iso_alp3;
  @override
  final String? iso_num;

  @override
  String toString() {
    return 'CountryCodeModel(country_eng_nm: $country_eng_nm, country_nm: $country_nm, country_iso_alp2: $country_iso_alp2, iso_alp3: $iso_alp3, iso_num: $iso_num)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CountryCodeModel &&
            (identical(other.country_eng_nm, country_eng_nm) ||
                const DeepCollectionEquality()
                    .equals(other.country_eng_nm, country_eng_nm)) &&
            (identical(other.country_nm, country_nm) ||
                const DeepCollectionEquality()
                    .equals(other.country_nm, country_nm)) &&
            (identical(other.country_iso_alp2, country_iso_alp2) ||
                const DeepCollectionEquality()
                    .equals(other.country_iso_alp2, country_iso_alp2)) &&
            (identical(other.iso_alp3, iso_alp3) ||
                const DeepCollectionEquality()
                    .equals(other.iso_alp3, iso_alp3)) &&
            (identical(other.iso_num, iso_num) ||
                const DeepCollectionEquality().equals(other.iso_num, iso_num)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(country_eng_nm) ^
      const DeepCollectionEquality().hash(country_nm) ^
      const DeepCollectionEquality().hash(country_iso_alp2) ^
      const DeepCollectionEquality().hash(iso_alp3) ^
      const DeepCollectionEquality().hash(iso_num);

  @JsonKey(ignore: true)
  @override
  _$CountryCodeModelCopyWith<_CountryCodeModel> get copyWith =>
      __$CountryCodeModelCopyWithImpl<_CountryCodeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CountryCodeModelToJson(this);
  }
}

abstract class _CountryCodeModel implements CountryCodeModel {
  factory _CountryCodeModel(
      {required String country_eng_nm,
      required String country_nm,
      required String country_iso_alp2,
      required String iso_alp3,
      String? iso_num}) = _$_CountryCodeModel;

  factory _CountryCodeModel.fromJson(Map<String, dynamic> json) =
      _$_CountryCodeModel.fromJson;

  @override
  String get country_eng_nm => throw _privateConstructorUsedError;
  @override
  String get country_nm => throw _privateConstructorUsedError;
  @override
  String get country_iso_alp2 => throw _privateConstructorUsedError;
  @override
  String get iso_alp3 => throw _privateConstructorUsedError;
  @override
  String? get iso_num => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CountryCodeModelCopyWith<_CountryCodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

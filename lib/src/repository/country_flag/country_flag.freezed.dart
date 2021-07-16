// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'country_flag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryFlagResponse _$CountryFlagResponseFromJson(Map<String, dynamic> json) {
  return _CountryFlagResponse.fromJson(json);
}

/// @nodoc
class _$CountryFlagResponseTearOff {
  const _$CountryFlagResponseTearOff();

  _CountryFlagResponse call(
      {required int totalCount,
      required int currentCount,
      required int numOfRows,
      required int pageNo,
      required List<CountryFlagModel> data}) {
    return _CountryFlagResponse(
      totalCount: totalCount,
      currentCount: currentCount,
      numOfRows: numOfRows,
      pageNo: pageNo,
      data: data,
    );
  }

  CountryFlagResponse fromJson(Map<String, Object> json) {
    return CountryFlagResponse.fromJson(json);
  }
}

/// @nodoc
const $CountryFlagResponse = _$CountryFlagResponseTearOff();

/// @nodoc
mixin _$CountryFlagResponse {
  int get totalCount => throw _privateConstructorUsedError;
  int get currentCount => throw _privateConstructorUsedError;
  int get numOfRows => throw _privateConstructorUsedError;
  int get pageNo => throw _privateConstructorUsedError;
  List<CountryFlagModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryFlagResponseCopyWith<CountryFlagResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryFlagResponseCopyWith<$Res> {
  factory $CountryFlagResponseCopyWith(
          CountryFlagResponse value, $Res Function(CountryFlagResponse) then) =
      _$CountryFlagResponseCopyWithImpl<$Res>;
  $Res call(
      {int totalCount,
      int currentCount,
      int numOfRows,
      int pageNo,
      List<CountryFlagModel> data});
}

/// @nodoc
class _$CountryFlagResponseCopyWithImpl<$Res>
    implements $CountryFlagResponseCopyWith<$Res> {
  _$CountryFlagResponseCopyWithImpl(this._value, this._then);

  final CountryFlagResponse _value;
  // ignore: unused_field
  final $Res Function(CountryFlagResponse) _then;

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
              as List<CountryFlagModel>,
    ));
  }
}

/// @nodoc
abstract class _$CountryFlagResponseCopyWith<$Res>
    implements $CountryFlagResponseCopyWith<$Res> {
  factory _$CountryFlagResponseCopyWith(_CountryFlagResponse value,
          $Res Function(_CountryFlagResponse) then) =
      __$CountryFlagResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int totalCount,
      int currentCount,
      int numOfRows,
      int pageNo,
      List<CountryFlagModel> data});
}

/// @nodoc
class __$CountryFlagResponseCopyWithImpl<$Res>
    extends _$CountryFlagResponseCopyWithImpl<$Res>
    implements _$CountryFlagResponseCopyWith<$Res> {
  __$CountryFlagResponseCopyWithImpl(
      _CountryFlagResponse _value, $Res Function(_CountryFlagResponse) _then)
      : super(_value, (v) => _then(v as _CountryFlagResponse));

  @override
  _CountryFlagResponse get _value => super._value as _CountryFlagResponse;

  @override
  $Res call({
    Object? totalCount = freezed,
    Object? currentCount = freezed,
    Object? numOfRows = freezed,
    Object? pageNo = freezed,
    Object? data = freezed,
  }) {
    return _then(_CountryFlagResponse(
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
              as List<CountryFlagModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryFlagResponse implements _CountryFlagResponse {
  _$_CountryFlagResponse(
      {required this.totalCount,
      required this.currentCount,
      required this.numOfRows,
      required this.pageNo,
      required this.data});

  factory _$_CountryFlagResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_CountryFlagResponseFromJson(json);

  @override
  final int totalCount;
  @override
  final int currentCount;
  @override
  final int numOfRows;
  @override
  final int pageNo;
  @override
  final List<CountryFlagModel> data;

  @override
  String toString() {
    return 'CountryFlagResponse(totalCount: $totalCount, currentCount: $currentCount, numOfRows: $numOfRows, pageNo: $pageNo, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CountryFlagResponse &&
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
  _$CountryFlagResponseCopyWith<_CountryFlagResponse> get copyWith =>
      __$CountryFlagResponseCopyWithImpl<_CountryFlagResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CountryFlagResponseToJson(this);
  }
}

abstract class _CountryFlagResponse implements CountryFlagResponse {
  factory _CountryFlagResponse(
      {required int totalCount,
      required int currentCount,
      required int numOfRows,
      required int pageNo,
      required List<CountryFlagModel> data}) = _$_CountryFlagResponse;

  factory _CountryFlagResponse.fromJson(Map<String, dynamic> json) =
      _$_CountryFlagResponse.fromJson;

  @override
  int get totalCount => throw _privateConstructorUsedError;
  @override
  int get currentCount => throw _privateConstructorUsedError;
  @override
  int get numOfRows => throw _privateConstructorUsedError;
  @override
  int get pageNo => throw _privateConstructorUsedError;
  @override
  List<CountryFlagModel> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CountryFlagResponseCopyWith<_CountryFlagResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

CountryFlagModel _$CountryFlagModelFromJson(Map<String, dynamic> json) {
  return _CountryFlagModel.fromJson(json);
}

/// @nodoc
class _$CountryFlagModelTearOff {
  const _$CountryFlagModelTearOff();

  _CountryFlagModel call(
      {required String country_eng_nm,
      required String country_nm,
      required String country_iso_alp2,
      required String download_url}) {
    return _CountryFlagModel(
      country_eng_nm: country_eng_nm,
      country_nm: country_nm,
      country_iso_alp2: country_iso_alp2,
      download_url: download_url,
    );
  }

  CountryFlagModel fromJson(Map<String, Object> json) {
    return CountryFlagModel.fromJson(json);
  }
}

/// @nodoc
const $CountryFlagModel = _$CountryFlagModelTearOff();

/// @nodoc
mixin _$CountryFlagModel {
  String get country_eng_nm => throw _privateConstructorUsedError;
  String get country_nm => throw _privateConstructorUsedError;
  String get country_iso_alp2 => throw _privateConstructorUsedError;
  String get download_url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryFlagModelCopyWith<CountryFlagModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryFlagModelCopyWith<$Res> {
  factory $CountryFlagModelCopyWith(
          CountryFlagModel value, $Res Function(CountryFlagModel) then) =
      _$CountryFlagModelCopyWithImpl<$Res>;
  $Res call(
      {String country_eng_nm,
      String country_nm,
      String country_iso_alp2,
      String download_url});
}

/// @nodoc
class _$CountryFlagModelCopyWithImpl<$Res>
    implements $CountryFlagModelCopyWith<$Res> {
  _$CountryFlagModelCopyWithImpl(this._value, this._then);

  final CountryFlagModel _value;
  // ignore: unused_field
  final $Res Function(CountryFlagModel) _then;

  @override
  $Res call({
    Object? country_eng_nm = freezed,
    Object? country_nm = freezed,
    Object? country_iso_alp2 = freezed,
    Object? download_url = freezed,
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
      download_url: download_url == freezed
          ? _value.download_url
          : download_url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CountryFlagModelCopyWith<$Res>
    implements $CountryFlagModelCopyWith<$Res> {
  factory _$CountryFlagModelCopyWith(
          _CountryFlagModel value, $Res Function(_CountryFlagModel) then) =
      __$CountryFlagModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String country_eng_nm,
      String country_nm,
      String country_iso_alp2,
      String download_url});
}

/// @nodoc
class __$CountryFlagModelCopyWithImpl<$Res>
    extends _$CountryFlagModelCopyWithImpl<$Res>
    implements _$CountryFlagModelCopyWith<$Res> {
  __$CountryFlagModelCopyWithImpl(
      _CountryFlagModel _value, $Res Function(_CountryFlagModel) _then)
      : super(_value, (v) => _then(v as _CountryFlagModel));

  @override
  _CountryFlagModel get _value => super._value as _CountryFlagModel;

  @override
  $Res call({
    Object? country_eng_nm = freezed,
    Object? country_nm = freezed,
    Object? country_iso_alp2 = freezed,
    Object? download_url = freezed,
  }) {
    return _then(_CountryFlagModel(
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
      download_url: download_url == freezed
          ? _value.download_url
          : download_url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryFlagModel implements _CountryFlagModel {
  _$_CountryFlagModel(
      {required this.country_eng_nm,
      required this.country_nm,
      required this.country_iso_alp2,
      required this.download_url});

  factory _$_CountryFlagModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CountryFlagModelFromJson(json);

  @override
  final String country_eng_nm;
  @override
  final String country_nm;
  @override
  final String country_iso_alp2;
  @override
  final String download_url;

  @override
  String toString() {
    return 'CountryFlagModel(country_eng_nm: $country_eng_nm, country_nm: $country_nm, country_iso_alp2: $country_iso_alp2, download_url: $download_url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CountryFlagModel &&
            (identical(other.country_eng_nm, country_eng_nm) ||
                const DeepCollectionEquality()
                    .equals(other.country_eng_nm, country_eng_nm)) &&
            (identical(other.country_nm, country_nm) ||
                const DeepCollectionEquality()
                    .equals(other.country_nm, country_nm)) &&
            (identical(other.country_iso_alp2, country_iso_alp2) ||
                const DeepCollectionEquality()
                    .equals(other.country_iso_alp2, country_iso_alp2)) &&
            (identical(other.download_url, download_url) ||
                const DeepCollectionEquality()
                    .equals(other.download_url, download_url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(country_eng_nm) ^
      const DeepCollectionEquality().hash(country_nm) ^
      const DeepCollectionEquality().hash(country_iso_alp2) ^
      const DeepCollectionEquality().hash(download_url);

  @JsonKey(ignore: true)
  @override
  _$CountryFlagModelCopyWith<_CountryFlagModel> get copyWith =>
      __$CountryFlagModelCopyWithImpl<_CountryFlagModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CountryFlagModelToJson(this);
  }
}

abstract class _CountryFlagModel implements CountryFlagModel {
  factory _CountryFlagModel(
      {required String country_eng_nm,
      required String country_nm,
      required String country_iso_alp2,
      required String download_url}) = _$_CountryFlagModel;

  factory _CountryFlagModel.fromJson(Map<String, dynamic> json) =
      _$_CountryFlagModel.fromJson;

  @override
  String get country_eng_nm => throw _privateConstructorUsedError;
  @override
  String get country_nm => throw _privateConstructorUsedError;
  @override
  String get country_iso_alp2 => throw _privateConstructorUsedError;
  @override
  String get download_url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CountryFlagModelCopyWith<_CountryFlagModel> get copyWith =>
      throw _privateConstructorUsedError;
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'mofa_notice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MofaNoticeResponse _$MofaNoticeResponseFromJson(Map<String, dynamic> json) {
  return _MofaNoticeResponse.fromJson(json);
}

/// @nodoc
class _$MofaNoticeResponseTearOff {
  const _$MofaNoticeResponseTearOff();

  _MofaNoticeResponse call(
      {required int totalCount,
      required int currentCount,
      required int numOfRows,
      required int pageNo,
      required List<MofaNoticeModel> data}) {
    return _MofaNoticeResponse(
      totalCount: totalCount,
      currentCount: currentCount,
      numOfRows: numOfRows,
      pageNo: pageNo,
      data: data,
    );
  }

  MofaNoticeResponse fromJson(Map<String, Object> json) {
    return MofaNoticeResponse.fromJson(json);
  }
}

/// @nodoc
const $MofaNoticeResponse = _$MofaNoticeResponseTearOff();

/// @nodoc
mixin _$MofaNoticeResponse {
  int get totalCount => throw _privateConstructorUsedError;
  int get currentCount => throw _privateConstructorUsedError;
  int get numOfRows => throw _privateConstructorUsedError;
  int get pageNo => throw _privateConstructorUsedError;
  List<MofaNoticeModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MofaNoticeResponseCopyWith<MofaNoticeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MofaNoticeResponseCopyWith<$Res> {
  factory $MofaNoticeResponseCopyWith(
          MofaNoticeResponse value, $Res Function(MofaNoticeResponse) then) =
      _$MofaNoticeResponseCopyWithImpl<$Res>;
  $Res call(
      {int totalCount,
      int currentCount,
      int numOfRows,
      int pageNo,
      List<MofaNoticeModel> data});
}

/// @nodoc
class _$MofaNoticeResponseCopyWithImpl<$Res>
    implements $MofaNoticeResponseCopyWith<$Res> {
  _$MofaNoticeResponseCopyWithImpl(this._value, this._then);

  final MofaNoticeResponse _value;
  // ignore: unused_field
  final $Res Function(MofaNoticeResponse) _then;

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
              as List<MofaNoticeModel>,
    ));
  }
}

/// @nodoc
abstract class _$MofaNoticeResponseCopyWith<$Res>
    implements $MofaNoticeResponseCopyWith<$Res> {
  factory _$MofaNoticeResponseCopyWith(
          _MofaNoticeResponse value, $Res Function(_MofaNoticeResponse) then) =
      __$MofaNoticeResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int totalCount,
      int currentCount,
      int numOfRows,
      int pageNo,
      List<MofaNoticeModel> data});
}

/// @nodoc
class __$MofaNoticeResponseCopyWithImpl<$Res>
    extends _$MofaNoticeResponseCopyWithImpl<$Res>
    implements _$MofaNoticeResponseCopyWith<$Res> {
  __$MofaNoticeResponseCopyWithImpl(
      _MofaNoticeResponse _value, $Res Function(_MofaNoticeResponse) _then)
      : super(_value, (v) => _then(v as _MofaNoticeResponse));

  @override
  _MofaNoticeResponse get _value => super._value as _MofaNoticeResponse;

  @override
  $Res call({
    Object? totalCount = freezed,
    Object? currentCount = freezed,
    Object? numOfRows = freezed,
    Object? pageNo = freezed,
    Object? data = freezed,
  }) {
    return _then(_MofaNoticeResponse(
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
              as List<MofaNoticeModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MofaNoticeResponse implements _MofaNoticeResponse {
  _$_MofaNoticeResponse(
      {required this.totalCount,
      required this.currentCount,
      required this.numOfRows,
      required this.pageNo,
      required this.data});

  factory _$_MofaNoticeResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_MofaNoticeResponseFromJson(json);

  @override
  final int totalCount;
  @override
  final int currentCount;
  @override
  final int numOfRows;
  @override
  final int pageNo;
  @override
  final List<MofaNoticeModel> data;

  @override
  String toString() {
    return 'MofaNoticeResponse(totalCount: $totalCount, currentCount: $currentCount, numOfRows: $numOfRows, pageNo: $pageNo, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MofaNoticeResponse &&
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
  _$MofaNoticeResponseCopyWith<_MofaNoticeResponse> get copyWith =>
      __$MofaNoticeResponseCopyWithImpl<_MofaNoticeResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MofaNoticeResponseToJson(this);
  }
}

abstract class _MofaNoticeResponse implements MofaNoticeResponse {
  factory _MofaNoticeResponse(
      {required int totalCount,
      required int currentCount,
      required int numOfRows,
      required int pageNo,
      required List<MofaNoticeModel> data}) = _$_MofaNoticeResponse;

  factory _MofaNoticeResponse.fromJson(Map<String, dynamic> json) =
      _$_MofaNoticeResponse.fromJson;

  @override
  int get totalCount => throw _privateConstructorUsedError;
  @override
  int get currentCount => throw _privateConstructorUsedError;
  @override
  int get numOfRows => throw _privateConstructorUsedError;
  @override
  int get pageNo => throw _privateConstructorUsedError;
  @override
  List<MofaNoticeModel> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MofaNoticeResponseCopyWith<_MofaNoticeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

MofaNoticeModel _$MofaNoticeModelFromJson(Map<String, dynamic> json) {
  return _MofaNoticeModel.fromJson(json);
}

/// @nodoc
class _$MofaNoticeModelTearOff {
  const _$MofaNoticeModelTearOff();

  _MofaNoticeModel call(
      {required String id,
      required String title,
      required String written_dt,
      String? txt_origin_cn,
      required String file_download_url}) {
    return _MofaNoticeModel(
      id: id,
      title: title,
      written_dt: written_dt,
      txt_origin_cn: txt_origin_cn,
      file_download_url: file_download_url,
    );
  }

  MofaNoticeModel fromJson(Map<String, Object> json) {
    return MofaNoticeModel.fromJson(json);
  }
}

/// @nodoc
const $MofaNoticeModel = _$MofaNoticeModelTearOff();

/// @nodoc
mixin _$MofaNoticeModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get written_dt => throw _privateConstructorUsedError;
  String? get txt_origin_cn => throw _privateConstructorUsedError;
  String get file_download_url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MofaNoticeModelCopyWith<MofaNoticeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MofaNoticeModelCopyWith<$Res> {
  factory $MofaNoticeModelCopyWith(
          MofaNoticeModel value, $Res Function(MofaNoticeModel) then) =
      _$MofaNoticeModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String written_dt,
      String? txt_origin_cn,
      String file_download_url});
}

/// @nodoc
class _$MofaNoticeModelCopyWithImpl<$Res>
    implements $MofaNoticeModelCopyWith<$Res> {
  _$MofaNoticeModelCopyWithImpl(this._value, this._then);

  final MofaNoticeModel _value;
  // ignore: unused_field
  final $Res Function(MofaNoticeModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? written_dt = freezed,
    Object? txt_origin_cn = freezed,
    Object? file_download_url = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      written_dt: written_dt == freezed
          ? _value.written_dt
          : written_dt // ignore: cast_nullable_to_non_nullable
              as String,
      txt_origin_cn: txt_origin_cn == freezed
          ? _value.txt_origin_cn
          : txt_origin_cn // ignore: cast_nullable_to_non_nullable
              as String?,
      file_download_url: file_download_url == freezed
          ? _value.file_download_url
          : file_download_url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MofaNoticeModelCopyWith<$Res>
    implements $MofaNoticeModelCopyWith<$Res> {
  factory _$MofaNoticeModelCopyWith(
          _MofaNoticeModel value, $Res Function(_MofaNoticeModel) then) =
      __$MofaNoticeModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String written_dt,
      String? txt_origin_cn,
      String file_download_url});
}

/// @nodoc
class __$MofaNoticeModelCopyWithImpl<$Res>
    extends _$MofaNoticeModelCopyWithImpl<$Res>
    implements _$MofaNoticeModelCopyWith<$Res> {
  __$MofaNoticeModelCopyWithImpl(
      _MofaNoticeModel _value, $Res Function(_MofaNoticeModel) _then)
      : super(_value, (v) => _then(v as _MofaNoticeModel));

  @override
  _MofaNoticeModel get _value => super._value as _MofaNoticeModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? written_dt = freezed,
    Object? txt_origin_cn = freezed,
    Object? file_download_url = freezed,
  }) {
    return _then(_MofaNoticeModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      written_dt: written_dt == freezed
          ? _value.written_dt
          : written_dt // ignore: cast_nullable_to_non_nullable
              as String,
      txt_origin_cn: txt_origin_cn == freezed
          ? _value.txt_origin_cn
          : txt_origin_cn // ignore: cast_nullable_to_non_nullable
              as String?,
      file_download_url: file_download_url == freezed
          ? _value.file_download_url
          : file_download_url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MofaNoticeModel implements _MofaNoticeModel {
  _$_MofaNoticeModel(
      {required this.id,
      required this.title,
      required this.written_dt,
      this.txt_origin_cn,
      required this.file_download_url});

  factory _$_MofaNoticeModel.fromJson(Map<String, dynamic> json) =>
      _$_$_MofaNoticeModelFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String written_dt;
  @override
  final String? txt_origin_cn;
  @override
  final String file_download_url;

  @override
  String toString() {
    return 'MofaNoticeModel(id: $id, title: $title, written_dt: $written_dt, txt_origin_cn: $txt_origin_cn, file_download_url: $file_download_url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MofaNoticeModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.written_dt, written_dt) ||
                const DeepCollectionEquality()
                    .equals(other.written_dt, written_dt)) &&
            (identical(other.txt_origin_cn, txt_origin_cn) ||
                const DeepCollectionEquality()
                    .equals(other.txt_origin_cn, txt_origin_cn)) &&
            (identical(other.file_download_url, file_download_url) ||
                const DeepCollectionEquality()
                    .equals(other.file_download_url, file_download_url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(written_dt) ^
      const DeepCollectionEquality().hash(txt_origin_cn) ^
      const DeepCollectionEquality().hash(file_download_url);

  @JsonKey(ignore: true)
  @override
  _$MofaNoticeModelCopyWith<_MofaNoticeModel> get copyWith =>
      __$MofaNoticeModelCopyWithImpl<_MofaNoticeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MofaNoticeModelToJson(this);
  }
}

abstract class _MofaNoticeModel implements MofaNoticeModel {
  factory _MofaNoticeModel(
      {required String id,
      required String title,
      required String written_dt,
      String? txt_origin_cn,
      required String file_download_url}) = _$_MofaNoticeModel;

  factory _MofaNoticeModel.fromJson(Map<String, dynamic> json) =
      _$_MofaNoticeModel.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get written_dt => throw _privateConstructorUsedError;
  @override
  String? get txt_origin_cn => throw _privateConstructorUsedError;
  @override
  String get file_download_url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MofaNoticeModelCopyWith<_MofaNoticeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

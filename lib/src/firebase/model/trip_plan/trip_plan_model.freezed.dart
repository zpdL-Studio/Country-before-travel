// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'trip_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TripPlanModel _$TripPlanModelFromJson(Map<String, dynamic> json) {
  return _TripPlanModel.fromJson(json);
}

/// @nodoc
class _$TripPlanModelTearOff {
  const _$TripPlanModelTearOff();

  _TripPlanModel call({@timeStamp DateTime? creation_time, String? name}) {
    return _TripPlanModel(
      creation_time: creation_time,
      name: name,
    );
  }

  TripPlanModel fromJson(Map<String, Object> json) {
    return TripPlanModel.fromJson(json);
  }
}

/// @nodoc
const $TripPlanModel = _$TripPlanModelTearOff();

/// @nodoc
mixin _$TripPlanModel {
  @timeStamp
  DateTime? get creation_time => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripPlanModelCopyWith<TripPlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripPlanModelCopyWith<$Res> {
  factory $TripPlanModelCopyWith(
          TripPlanModel value, $Res Function(TripPlanModel) then) =
      _$TripPlanModelCopyWithImpl<$Res>;
  $Res call({@timeStamp DateTime? creation_time, String? name});
}

/// @nodoc
class _$TripPlanModelCopyWithImpl<$Res>
    implements $TripPlanModelCopyWith<$Res> {
  _$TripPlanModelCopyWithImpl(this._value, this._then);

  final TripPlanModel _value;
  // ignore: unused_field
  final $Res Function(TripPlanModel) _then;

  @override
  $Res call({
    Object? creation_time = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      creation_time: creation_time == freezed
          ? _value.creation_time
          : creation_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$TripPlanModelCopyWith<$Res>
    implements $TripPlanModelCopyWith<$Res> {
  factory _$TripPlanModelCopyWith(
          _TripPlanModel value, $Res Function(_TripPlanModel) then) =
      __$TripPlanModelCopyWithImpl<$Res>;
  @override
  $Res call({@timeStamp DateTime? creation_time, String? name});
}

/// @nodoc
class __$TripPlanModelCopyWithImpl<$Res>
    extends _$TripPlanModelCopyWithImpl<$Res>
    implements _$TripPlanModelCopyWith<$Res> {
  __$TripPlanModelCopyWithImpl(
      _TripPlanModel _value, $Res Function(_TripPlanModel) _then)
      : super(_value, (v) => _then(v as _TripPlanModel));

  @override
  _TripPlanModel get _value => super._value as _TripPlanModel;

  @override
  $Res call({
    Object? creation_time = freezed,
    Object? name = freezed,
  }) {
    return _then(_TripPlanModel(
      creation_time: creation_time == freezed
          ? _value.creation_time
          : creation_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TripPlanModel implements _TripPlanModel {
  _$_TripPlanModel({@timeStamp this.creation_time, this.name});

  factory _$_TripPlanModel.fromJson(Map<String, dynamic> json) =>
      _$_$_TripPlanModelFromJson(json);

  @override
  @timeStamp
  final DateTime? creation_time;
  @override
  final String? name;

  @override
  String toString() {
    return 'TripPlanModel(creation_time: $creation_time, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TripPlanModel &&
            (identical(other.creation_time, creation_time) ||
                const DeepCollectionEquality()
                    .equals(other.creation_time, creation_time)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(creation_time) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$TripPlanModelCopyWith<_TripPlanModel> get copyWith =>
      __$TripPlanModelCopyWithImpl<_TripPlanModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TripPlanModelToJson(this);
  }
}

abstract class _TripPlanModel implements TripPlanModel {
  factory _TripPlanModel({@timeStamp DateTime? creation_time, String? name}) =
      _$_TripPlanModel;

  factory _TripPlanModel.fromJson(Map<String, dynamic> json) =
      _$_TripPlanModel.fromJson;

  @override
  @timeStamp
  DateTime? get creation_time => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TripPlanModelCopyWith<_TripPlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

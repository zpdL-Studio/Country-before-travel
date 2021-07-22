// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TripPlanModel _$_$_TripPlanModelFromJson(Map<String, dynamic> json) {
  return _$_TripPlanModel(
    creation_time: timeStampFromJson(json['creation_time'] as Timestamp?),
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$_$_TripPlanModelToJson(_$_TripPlanModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('creation_time', timeStampToJson(instance.creation_time));
  writeNotNull('name', instance.name);
  return val;
}

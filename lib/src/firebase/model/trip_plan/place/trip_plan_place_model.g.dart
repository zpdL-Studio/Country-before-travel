// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_plan_place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TripPlanPlaceModel _$_$_TripPlanPlaceModelFromJson(
    Map<String, dynamic> json) {
  return _$_TripPlanPlaceModel(
    order: json['order'] as int,
    google_place_id: json['google_place_id'] as String,
    name: json['name'] as String,
    adrAddress: json['adrAddress'] as String,
    lat: (json['lat'] as num).toDouble(),
    lng: (json['lng'] as num).toDouble(),
    phone_number: json['phone_number'] as String,
  );
}

Map<String, dynamic> _$_$_TripPlanPlaceModelToJson(
        _$_TripPlanPlaceModel instance) =>
    <String, dynamic>{
      'order': instance.order,
      'google_place_id': instance.google_place_id,
      'name': instance.name,
      'adrAddress': instance.adrAddress,
      'lat': instance.lat,
      'lng': instance.lng,
      'phone_number': instance.phone_number,
    };

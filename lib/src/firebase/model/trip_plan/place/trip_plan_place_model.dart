import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../firebase_model.dart';

part 'trip_plan_place_model.freezed.dart';
part 'trip_plan_place_model.g.dart';

@freezed
class TripPlanPlaceModel with _$TripPlanPlaceModel {
  factory TripPlanPlaceModel({
    required int order,
    required String google_place_id,
    required String name,
    required String adrAddress,
    required double lat,
    required double lng,
    required String phone_number,
  }) = _TripPlanPlaceModel;

  static FirebaseModel<TripPlanPlaceModel> fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return FirebaseModel(doc.id, TripPlanPlaceModel.fromJson(json));
  }

  factory TripPlanPlaceModel.fromJson(Map<String, dynamic> json) => _$TripPlanPlaceModelFromJson(json);

}

extension TripPlanPlaceModelExtension on TripPlanPlaceModel {
}
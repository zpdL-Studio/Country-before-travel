import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_before_travel/src/firebase/model/firebase_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../firebase_json_annotation.dart';

part 'trip_plan_model.freezed.dart';
part 'trip_plan_model.g.dart';

@freezed
class TripPlanModel with _$TripPlanModel {
  factory TripPlanModel({
    @timeStamp DateTime? creation_time,
    String? name,
  }) = _TripPlanModel;

  static FirebaseModel<TripPlanModel> fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return FirebaseModel(doc.id, TripPlanModel.fromJson(json));
  }

  factory TripPlanModel.fromJson(Map<String, dynamic> json) => _$TripPlanModelFromJson(json);

}

extension TripPlanModelExtension on TripPlanModel {
}
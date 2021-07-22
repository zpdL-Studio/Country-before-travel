import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../firebase_json_annotation.dart';

// part 'trip_plan_daily_model.freezed.dart';
// part 'trip_plan_daily_model.g.dart';
//
// @freezed
// class TripPlanDailyModel with _$TripPlanDailyModel {
//   factory TripPlanDailyModel({
//     @timeStampNotnull DateTime creation_time,
//   }) = _TripPlanDailyModel;
//
//   factory TripPlanDailyModel.fromFireStore(DocumentSnapshot doc) {
//     Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
//     return TripPlanDailyModel.fromJson(json);
//   }
//
//   factory TripPlanDailyModel.fromJson(Map<String, dynamic> json) => _$TripPlanDailyModel(json);
//
// }
//
// extension TripPlanDailyModelExtension on TripPlanDailyModel {
// }
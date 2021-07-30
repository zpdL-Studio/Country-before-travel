import 'package:get/get.dart';

import 'auth/auth_service.dart';
import 'google_place/google_place_service.dart';
import 'hive/hive_service.dart';
import 'trip_plan/trip_plan_service.dart';

Future<void> initServices() async {
  await Get.putAsync(() => HiveService().init());
  await Get.putAsync(() => GooglePlaceService().init());
  await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => TripPlanService().init());
}
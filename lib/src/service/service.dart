import 'package:get/get.dart';

import 'google_place/google_place_service.dart';
import 'hive/hive_service.dart';

Future<void> initServices() async {
  await Get.putAsync(() => HiveService().init());
  Get.put(GooglePlaceService());
}
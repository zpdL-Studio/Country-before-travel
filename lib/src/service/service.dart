import 'package:get/get.dart';

import 'hive/hive_service.dart';

Future<void> initServices() async {
  await Get.putAsync(() => HiveService().init());
}

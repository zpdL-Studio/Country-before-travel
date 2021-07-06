import 'package:get/get.dart';

import 'map_controller.dart';

class MapBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapController());
  }
}
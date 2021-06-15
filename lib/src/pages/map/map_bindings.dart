import 'package:get/get.dart';

import 'map_controller.dart';
import 'map_page.dart';

class MapBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapController());
  }

  static GetPage getPage(String name) => GetPage(
    name: name,
    binding: MapBindings(),
    page: () => MapPage(),
  );
}
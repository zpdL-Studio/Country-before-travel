import 'package:get/get.dart';

import 'place_search_controller.dart';
import 'place_search_page.dart';

class PlaceSearchBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlaceSearchController(googlePlace: Get.find()));
  }

  static GetPage getPage(String name) => GetPage(
    name: name,
    binding: PlaceSearchBindings(),
    page: () => PlaceSearchPage(),
  );
}
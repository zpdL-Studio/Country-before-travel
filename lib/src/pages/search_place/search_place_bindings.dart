import 'package:get/get.dart';

import 'search_place_controller.dart';
import 'search_place_page.dart';

class SearchPlaceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchPlaceController(googlePlace: Get.find()));
  }

  static GetPage getPage(String name) => GetPage(
    name: name,
    binding: SearchPlaceBindings(),
    page: () => SearchPlacePage(),
  );
}
import 'package:get/get.dart';

import 'place_detail_controller.dart';
import 'place_detail_page.dart';

class PlaceDetailBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => PlaceDetailController(googlePlace: Get.find()));
  }

  static Map<String, String> parameters(String id) => {
    ParametersPlaceId : id
  };

  static GetPage getPage(String name) => GetPage(
    name: name,
    binding: PlaceDetailBindings(),
    page: () => PlaceDetailPage(),
  );
}
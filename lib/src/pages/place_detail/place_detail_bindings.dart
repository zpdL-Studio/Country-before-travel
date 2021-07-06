import 'package:get/get.dart';

import 'place_detail_controller.dart';

class PlaceDetailBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => PlaceDetailController(googlePlace: Get.find()));
  }

  static Map<String, String> parameters(String id) => {
    ParametersPlaceId : id
  };
}
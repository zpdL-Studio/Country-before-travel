import 'package:get/get.dart';

import 'place_detail_contract.dart';
import 'place_detail_controller.dart';
import 'place_detail_page.dart';

class PlaceDetailBindings extends Bindings {

  final Mode mode;

  PlaceDetailBindings(this.mode);

  @override
  void dependencies() {
    Get.lazyPut(() => PlaceDetailController(googlePlace: Get.find()));
  }

  static GetPage getPageInSelect(String name) =>
      getPage(name, mode: Mode.SELECT);

  static GetPage getPage(String name, {Mode mode = Mode.DEFAULT}) => GetPage(
        name: name,
        binding: PlaceDetailBindings(mode),
        page: () => PlaceDetailPage(),
      );

  static Future<dynamic>? to(String name, String id) => Get.toNamed(name, parameters: {
    Parameters.PLACE_ID.value : id
  });
}
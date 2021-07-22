import 'package:get/get.dart';

import '../place_detail/place_detail_bindings.dart';
import 'place_search_contract.dart';
import 'place_search_controller.dart';
import 'place_search_page.dart';

class PlaceSearchBindings extends Bindings {

  static const DETAIL = '/detail';

  final Mode mode;

  PlaceSearchBindings(this.mode);

  @override
  void dependencies() {
    Get.lazyPut(() => PlaceSearchController(mode, googlePlace: Get.find()));
  }

  static GetPage getPageInSelect(String name) => getPage(name, mode: Mode.SELECT);

  static GetPage getPage(String name, {Mode mode = Mode.DEFAULT}) => GetPage(
    name: name,
    binding: PlaceSearchBindings(mode),
    page: () => PlaceSearchPage(),
    children: [
      if(mode == Mode.SELECT)
        PlaceDetailBindings.getPageInSelect(DETAIL)
      else
        PlaceDetailBindings.getPage(DETAIL)
    ]
  );

  static Future<dynamic>? toDetail(String placeId) => PlaceDetailBindings.to('${Get.currentRoute}$DETAIL', placeId);
}


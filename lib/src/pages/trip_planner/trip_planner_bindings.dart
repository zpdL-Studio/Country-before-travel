import 'package:get/get.dart';

import '../place_search/place_search_bindings.dart';
import 'trip_planner_controller.dart';
import 'trip_planner_page.dart';

class TripPlannerBindings extends Bindings {

  static const SEARCH = '/search';

  @override
  void dependencies() {
    Get.lazyPut(() => TripPlannerController());
  }

  static GetPage getPage(String name) => GetPage(
    name: name,
    binding: TripPlannerBindings(),
    page: () => TripPlannerPage(),
    children: [
      PlaceSearchBindings.getPageInSelect(SEARCH),
    ]
  );

  static Future<dynamic>? toSearch() => Get.toNamed('${Get.currentRoute}$SEARCH');
}
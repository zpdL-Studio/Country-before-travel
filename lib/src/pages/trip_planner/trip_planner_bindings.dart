import 'package:get/get.dart';

import '../place_search/place_search_bindings.dart';
import 'trip_planner_controller.dart';
import 'trip_planner_page.dart';

class TripPlannerBindings extends Bindings {

  static const SEARCH = '/search';

  @override
  void dependencies() {
    Get.lazyPut(() => TripPlannerController(Get.find(), Get.find()));
  }

  static GetPage getPage(String name) => GetPage(
    name: name,
    binding: TripPlannerBindings(),
    page: () => TripPlannerPage(),
    children: [
      PlaceSearchBindings.getPageInSelect(SEARCH),
    ]
  );

  static Future<dynamic>? toSearch() {
    final uri = Uri.parse(Get.currentRoute);
    print('uri.path : ${uri.path}');
    print('uri.data : ${uri.data}');
    print('uri.queryParameters : ${uri.queryParameters}');
    return Get.toNamed('${uri.path}$SEARCH');
  }
}
import 'package:get/get.dart';

import 'trip_planner_controller.dart';
import 'trip_planner_page.dart';

class TripPlannerBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => TripPlannerController());
  }

  static Map<String, String> parameters(String id) => {
    ParametersPlaceId : id
  };

  static GetPage getPage(String name) => GetPage(
    name: name,
    binding: TripPlannerBindings(),
    page: () => TripPlannerPage(),
  );
}
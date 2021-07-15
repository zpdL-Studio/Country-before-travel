import 'package:country_before_travel/src/pages/trip_planner/trip_planner_bindings.dart';
import 'package:get/get.dart';

import '../service/auth/auth_service.dart';
import 'home/home_bindings.dart';
import 'login/login_bindings.dart';
import 'login/login_contract.dart';
import 'map/map_bindings.dart';
import 'mofa_notice/mofa_notice.dart';
import 'mofa_notice/mofa_notice_list_page.dart';
import 'place_detail/place_detail_bindings.dart';
import 'place_search/place_search_bindings.dart';
import 'search/search_bindings.dart';
import 'search/search_page.dart';

enum Routes {
  HOME,
  SEARCH,
  MOFA_NOTICE_LIST,
  MAP,
  LOGIN,
  PLACE_SEARCH,
  PLACE_DETAIL,
  TRIP_PLANNER,
}

extension RoutesExtension on Routes {
  String get name {
    switch(this) {
      case Routes.HOME:
        return '/';
      case Routes.SEARCH:
        return '/search';
      case Routes.MOFA_NOTICE_LIST:
        return '/mofa_notice_list';
      case Routes.MAP:
        return '/map';
      case Routes.LOGIN:
        return '/login';
      case Routes.PLACE_SEARCH:
        return '/place_search';
      case Routes.PLACE_DETAIL:
        return '/place_detail';
      case Routes.TRIP_PLANNER:
        return '/trip_planner';
    }
  }

  Future<T?>? toNamed<T>({
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    return Get.toNamed(name,
        arguments: arguments,
        id: id,
        preventDuplicates: preventDuplicates,
        parameters: parameters);
  }

  Future<T?>? toNamedWithLogin<T>({
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    final authService = Get.find<AuthService>();
    if(authService.isLogin()) {
      return Get.toNamed(name,
          arguments: arguments,
          id: id,
          preventDuplicates: preventDuplicates,
          parameters: parameters);
    } else {
      return Get.toNamed(
        Routes.LOGIN.name,
        arguments: LoginRouteArguments(this.name,
            arguments: arguments,
            id: id,
            preventDuplicates: preventDuplicates,
            parameters: parameters),
      );
    }
  }

  GetPage get page {
    switch (this) {
      case Routes.HOME:
        return HomeBindings.getPage(name);
      case Routes.SEARCH:
        return GetPage(
          name: name,
          binding: SearchBindings(),
          page: () => SearchPage(),
        );
      case Routes.MOFA_NOTICE_LIST:
        return GetPage(
          name: name,
          binding: MofaNoticeBindings(),
          page: () => MofaNoticeListPage(),
        );
      case Routes.MAP:
        return MapBindings.getPage(name);
      case Routes.LOGIN:
        return LoginBindings.getPage(name);
      case Routes.PLACE_SEARCH:
        return PlaceSearchBindings.getPage(name);
      case Routes.PLACE_DETAIL:
        return PlaceDetailBindings.getPage(name);
      case Routes.TRIP_PLANNER:
        return TripPlannerBindings.getPage(name);
    }
  }
}
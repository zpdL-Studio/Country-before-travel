import 'package:get/get.dart';

import 'home/home_bindings.dart';
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
  PLACE_SEARCH,
  PLACE_DETAIL,
}

extension RouteExtension on Routes {
  String get route {
    switch(this) {
      case Routes.HOME:
        return '/';
      case Routes.SEARCH:
        return '/search';
      case Routes.MOFA_NOTICE_LIST:
        return '/mofa_notice_list';
      case Routes.MAP:
        return '/map';
      case Routes.PLACE_SEARCH:
        return '/place_search';
      case Routes.PLACE_DETAIL:
        return '/place_detail';
    }
  }

  Future<T?>? toNamed<T>({
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    return Get.toNamed(route,
        arguments: arguments,
        id: id,
        preventDuplicates: preventDuplicates,
        parameters: parameters);
  }

  GetPage get page {
    switch (this) {
      case Routes.HOME:
        return HomeBindings.getPage(route);
      case Routes.SEARCH:
        return GetPage(
          name: route,
          binding: SearchBindings(),
          page: () => SearchPage(),
        );
      case Routes.MOFA_NOTICE_LIST:
        return GetPage(
          name: route,
          binding: MofaNoticeBindings(),
          page: () => MofaNoticeListPage(),
        );
      case Routes.MAP:
        return MapBindings.getPage(route);
      case Routes.PLACE_SEARCH:
        return PlaceSearchBindings.getPage(route);
      case Routes.PLACE_DETAIL:
        return PlaceDetailBindings.getPage(route);
    }
  }
}
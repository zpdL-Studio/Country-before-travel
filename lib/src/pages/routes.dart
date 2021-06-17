import 'package:get/get.dart';

import 'home/home_bindings.dart';
import 'map/map_bindings.dart';
import 'mofa_notice/mofa_notice.dart';
import 'mofa_notice/mofa_notice_list_page.dart';
import 'search/search_bindings.dart';
import 'search/search_page.dart';
import 'search_place/search_place_bindings.dart';

enum Routes {
  HOME,
  SEARCH,
  MOFA_NOTICE_LIST,
  MAP,
  SEARCH_PLACE,
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
      case Routes.SEARCH_PLACE:
        return '/search_place';
    }
  }

  GetPage get page {
    switch(this) {
      case Routes.HOME:
        return HomeBindings.getPage(route);
      case Routes.SEARCH:
        return GetPage(
          name: route,
          binding: SearchBindings(),
          page: () => SearchPage(),
          children: [

          ]
        );
      case Routes.MOFA_NOTICE_LIST:
        return GetPage(
          name: route,
          binding: MofaNoticeBindings(),
          page: () => MofaNoticeListPage(),
        );
      case Routes.MAP:
        return MapBindings.getPage(route);
      case Routes.SEARCH_PLACE:
        return SearchPlaceBindings.getPage(route);
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
}

// abstract class Routes {
//   static const HOME = '/';
//   static const SEARCH = '/search';
//   static const MOFA_NOTICE_LIST = '/mofa_notice_list';
//   static const MAP = '/map';
//   static const SEARCH_PLACE = '/search_place';
//
//   static final routes = [
//     GetPage(
//       name: Routes.HOME,
//       binding: HomeBindings(),
//       page: () => HomePage(),
//     ),
//     GetPage(
//       name: Routes.SEARCH,
//       binding: SearchBindings(),
//       page: () => SearchPage(),
//     ),
//     GetPage(
//       name: Routes.MOFA_NOTICE_LIST,
//       binding: MofaNoticeBindings(),
//       page: () => MofaNoticeListPage(),
//     ),
//     GetPage(
//       name: Routes.MAP,
//       binding: MapBindings(),
//       page: () => MapPage(),
//     ),
//   ];
// }